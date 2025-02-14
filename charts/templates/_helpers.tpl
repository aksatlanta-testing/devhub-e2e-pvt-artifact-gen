
{{- define "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.fullname" -}}
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


{{- define "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.labels" -}}
helm.sh/chart: {{ include "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.chart" . }}
{{ include "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1ada1d3-c242-4cc4-be4d-c95daa495946.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}