
{{- define "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.fullname" -}}
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


{{- define "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.labels" -}}
helm.sh/chart: {{ include "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.chart" . }}
{{ include "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99f95207-4471-4ef6-b45d-d11b8423533c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}