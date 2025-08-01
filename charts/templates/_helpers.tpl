
{{- define "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.fullname" -}}
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


{{- define "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.labels" -}}
helm.sh/chart: {{ include "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.chart" . }}
{{ include "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod89f74a1-2efd-4fe0-8e42-9d71e6b0ff83.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}