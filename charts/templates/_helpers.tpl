
{{- define "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.fullname" -}}
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


{{- define "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.labels" -}}
helm.sh/chart: {{ include "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.chart" . }}
{{ include "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo85922618-9222-4a71-8c72-ccb86c7cbbdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}