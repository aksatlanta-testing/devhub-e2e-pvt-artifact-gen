
{{- define "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.fullname" -}}
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


{{- define "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.labels" -}}
helm.sh/chart: {{ include "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.chart" . }}
{{ include "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaea4150d-bf77-4f01-b20e-215976d1a15a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}