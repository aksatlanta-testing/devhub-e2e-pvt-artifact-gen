
{{- define "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.fullname" -}}
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


{{- define "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.labels" -}}
helm.sh/chart: {{ include "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.chart" . }}
{{ include "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo36523873-f9b8-4ece-9c1d-45f6b5a5090b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}