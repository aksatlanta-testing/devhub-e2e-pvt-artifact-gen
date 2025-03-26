
{{- define "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.fullname" -}}
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


{{- define "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.labels" -}}
helm.sh/chart: {{ include "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.chart" . }}
{{ include "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2f86e51-6e52-4b46-b8d2-bc310d96dc4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}