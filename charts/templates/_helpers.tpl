
{{- define "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.fullname" -}}
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


{{- define "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.labels" -}}
helm.sh/chart: {{ include "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.chart" . }}
{{ include "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodec1fb54-0f8a-4e7b-a48d-fa3e7b26e934.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}