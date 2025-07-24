
{{- define "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.fullname" -}}
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


{{- define "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.labels" -}}
helm.sh/chart: {{ include "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.chart" . }}
{{ include "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9cde84f-8d80-44a2-9438-9a468cf7dd0d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}