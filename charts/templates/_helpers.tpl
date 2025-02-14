
{{- define "go-echoab04a773-493e-467f-b947-65673d7bf384.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab04a773-493e-467f-b947-65673d7bf384.fullname" -}}
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


{{- define "go-echoab04a773-493e-467f-b947-65673d7bf384.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab04a773-493e-467f-b947-65673d7bf384.labels" -}}
helm.sh/chart: {{ include "go-echoab04a773-493e-467f-b947-65673d7bf384.chart" . }}
{{ include "go-echoab04a773-493e-467f-b947-65673d7bf384.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab04a773-493e-467f-b947-65673d7bf384.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab04a773-493e-467f-b947-65673d7bf384.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}