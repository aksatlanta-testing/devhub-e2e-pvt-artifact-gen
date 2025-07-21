
{{- define "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.fullname" -}}
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


{{- define "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.labels" -}}
helm.sh/chart: {{ include "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.chart" . }}
{{ include "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1591199c-9b96-41a6-a9e6-6e3809d8b8ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}