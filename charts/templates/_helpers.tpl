
{{- define "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.labels" -}}
helm.sh/chart: {{ include "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.chart" . }}
{{ include "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2d6ec19-6e37-4657-b3cb-25a886bd09ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}