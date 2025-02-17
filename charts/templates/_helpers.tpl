
{{- define "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.fullname" -}}
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


{{- define "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.labels" -}}
helm.sh/chart: {{ include "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.chart" . }}
{{ include "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe125ca72-acb6-45d8-96c7-9e7315c7a82d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}