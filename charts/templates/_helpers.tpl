
{{- define "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.fullname" -}}
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


{{- define "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.labels" -}}
helm.sh/chart: {{ include "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.chart" . }}
{{ include "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcd1aaef-bdea-466a-9c02-713cb8b2ae23.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}