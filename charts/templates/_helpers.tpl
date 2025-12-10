
{{- define "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.fullname" -}}
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


{{- define "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.labels" -}}
helm.sh/chart: {{ include "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.chart" . }}
{{ include "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe2b7cdd-0120-4bef-ba6c-6008796c06ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}