
{{- define "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.fullname" -}}
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


{{- define "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.labels" -}}
helm.sh/chart: {{ include "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.chart" . }}
{{ include "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5a73248-a2dc-4ded-80c6-d3141a857d11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}