
{{- define "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.fullname" -}}
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


{{- define "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.labels" -}}
helm.sh/chart: {{ include "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.chart" . }}
{{ include "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeab82083-5e02-4884-85e7-c41f116fe2cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}