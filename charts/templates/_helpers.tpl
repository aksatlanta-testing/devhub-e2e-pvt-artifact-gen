
{{- define "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.fullname" -}}
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


{{- define "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.labels" -}}
helm.sh/chart: {{ include "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.chart" . }}
{{ include "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb8a6fb6-536d-4abb-b48d-a79588975dee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}