
{{- define "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.fullname" -}}
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


{{- define "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.labels" -}}
helm.sh/chart: {{ include "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.chart" . }}
{{ include "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa797277c-c8c1-4b65-95d7-589a50ec1d4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}