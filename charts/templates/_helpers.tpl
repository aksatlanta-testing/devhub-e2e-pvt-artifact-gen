
{{- define "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.fullname" -}}
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


{{- define "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.labels" -}}
helm.sh/chart: {{ include "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.chart" . }}
{{ include "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo79b77d7b-b1f3-4886-be7b-8346cf9f5cc6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}