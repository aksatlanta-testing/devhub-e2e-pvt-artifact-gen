
{{- define "go-echodb55a045-981a-44f4-8303-7748683afb6e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb55a045-981a-44f4-8303-7748683afb6e.fullname" -}}
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


{{- define "go-echodb55a045-981a-44f4-8303-7748683afb6e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodb55a045-981a-44f4-8303-7748683afb6e.labels" -}}
helm.sh/chart: {{ include "go-echodb55a045-981a-44f4-8303-7748683afb6e.chart" . }}
{{ include "go-echodb55a045-981a-44f4-8303-7748683afb6e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodb55a045-981a-44f4-8303-7748683afb6e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodb55a045-981a-44f4-8303-7748683afb6e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}