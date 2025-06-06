
{{- define "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.fullname" -}}
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


{{- define "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.labels" -}}
helm.sh/chart: {{ include "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.chart" . }}
{{ include "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1dbf3cc0-477d-40f5-b81f-e966f39c6aee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}