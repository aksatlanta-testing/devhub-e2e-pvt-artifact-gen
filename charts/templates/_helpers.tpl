
{{- define "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.fullname" -}}
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


{{- define "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.labels" -}}
helm.sh/chart: {{ include "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.chart" . }}
{{ include "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d4347e0-9fcd-46a7-9be5-284531aec3bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}