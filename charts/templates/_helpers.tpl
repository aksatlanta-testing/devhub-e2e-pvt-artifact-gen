
{{- define "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.fullname" -}}
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


{{- define "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.labels" -}}
helm.sh/chart: {{ include "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.chart" . }}
{{ include "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod6f04044-d336-42b5-b247-7afe0cc6418b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}