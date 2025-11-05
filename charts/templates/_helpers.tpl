
{{- define "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.fullname" -}}
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


{{- define "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.labels" -}}
helm.sh/chart: {{ include "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.chart" . }}
{{ include "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod6a2b4b7-aa17-42c2-9c25-a199a49ce340.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}