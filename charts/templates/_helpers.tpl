
{{- define "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.fullname" -}}
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


{{- define "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.labels" -}}
helm.sh/chart: {{ include "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.chart" . }}
{{ include "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod74f7977-102e-4dd8-a3da-16dbf084930f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}