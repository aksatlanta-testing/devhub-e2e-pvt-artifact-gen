
{{- define "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.fullname" -}}
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


{{- define "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.labels" -}}
helm.sh/chart: {{ include "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.chart" . }}
{{ include "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo58f4f2a6-b7be-4f9d-8b28-f4c1c72a6d03.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}