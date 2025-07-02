
{{- define "go-echoac991ab9-a463-4777-b624-b03444e0f48c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac991ab9-a463-4777-b624-b03444e0f48c.fullname" -}}
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


{{- define "go-echoac991ab9-a463-4777-b624-b03444e0f48c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac991ab9-a463-4777-b624-b03444e0f48c.labels" -}}
helm.sh/chart: {{ include "go-echoac991ab9-a463-4777-b624-b03444e0f48c.chart" . }}
{{ include "go-echoac991ab9-a463-4777-b624-b03444e0f48c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac991ab9-a463-4777-b624-b03444e0f48c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac991ab9-a463-4777-b624-b03444e0f48c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}