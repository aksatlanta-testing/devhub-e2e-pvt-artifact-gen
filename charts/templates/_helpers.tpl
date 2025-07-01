
{{- define "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.fullname" -}}
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


{{- define "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.labels" -}}
helm.sh/chart: {{ include "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.chart" . }}
{{ include "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb8603cc-2f18-45ba-9358-78a3a25d4980.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}