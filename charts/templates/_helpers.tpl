
{{- define "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.fullname" -}}
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


{{- define "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.labels" -}}
helm.sh/chart: {{ include "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.chart" . }}
{{ include "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecef4cef-7657-40ab-b0d4-844b90f7c9ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}