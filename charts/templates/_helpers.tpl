
{{- define "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.fullname" -}}
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


{{- define "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.labels" -}}
helm.sh/chart: {{ include "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.chart" . }}
{{ include "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc039cfa-360d-4753-aaf7-3499f8b70717.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}