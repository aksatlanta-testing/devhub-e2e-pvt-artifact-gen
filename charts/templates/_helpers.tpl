
{{- define "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.fullname" -}}
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


{{- define "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.labels" -}}
helm.sh/chart: {{ include "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.chart" . }}
{{ include "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac129a9f-a553-4ea0-bb9f-315fa39f5c55.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}