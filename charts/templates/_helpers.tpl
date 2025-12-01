
{{- define "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.fullname" -}}
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


{{- define "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.labels" -}}
helm.sh/chart: {{ include "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.chart" . }}
{{ include "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo37d06e08-1135-4b72-8efd-8fb53a90391a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}