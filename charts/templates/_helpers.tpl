
{{- define "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.fullname" -}}
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


{{- define "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.labels" -}}
helm.sh/chart: {{ include "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.chart" . }}
{{ include "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2ba641f-37af-4f71-9425-9d0dbb5d8d2c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}