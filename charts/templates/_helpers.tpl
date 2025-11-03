
{{- define "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.fullname" -}}
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


{{- define "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.labels" -}}
helm.sh/chart: {{ include "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.chart" . }}
{{ include "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe21ad9e6-b916-41e9-b7c3-e1e7a5ca4182.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}