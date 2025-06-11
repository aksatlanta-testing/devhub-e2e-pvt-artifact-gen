
{{- define "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.fullname" -}}
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


{{- define "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.labels" -}}
helm.sh/chart: {{ include "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.chart" . }}
{{ include "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a46ecd4-9431-41c6-adbf-8f9f960b9aaf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}