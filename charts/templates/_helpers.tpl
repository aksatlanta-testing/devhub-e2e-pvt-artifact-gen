
{{- define "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.fullname" -}}
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


{{- define "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.labels" -}}
helm.sh/chart: {{ include "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.chart" . }}
{{ include "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb99ec1c-7d2c-4000-8ac9-af0b5583dd60.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}