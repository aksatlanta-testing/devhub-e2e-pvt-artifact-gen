
{{- define "go-echoca021346-701b-4961-b620-ee028c9a3386.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca021346-701b-4961-b620-ee028c9a3386.fullname" -}}
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


{{- define "go-echoca021346-701b-4961-b620-ee028c9a3386.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca021346-701b-4961-b620-ee028c9a3386.labels" -}}
helm.sh/chart: {{ include "go-echoca021346-701b-4961-b620-ee028c9a3386.chart" . }}
{{ include "go-echoca021346-701b-4961-b620-ee028c9a3386.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca021346-701b-4961-b620-ee028c9a3386.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca021346-701b-4961-b620-ee028c9a3386.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}