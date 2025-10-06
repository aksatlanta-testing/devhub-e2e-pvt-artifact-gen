
{{- define "go-echo5a48acce-604c-49ae-8064-98f726d3c079.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a48acce-604c-49ae-8064-98f726d3c079.fullname" -}}
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


{{- define "go-echo5a48acce-604c-49ae-8064-98f726d3c079.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a48acce-604c-49ae-8064-98f726d3c079.labels" -}}
helm.sh/chart: {{ include "go-echo5a48acce-604c-49ae-8064-98f726d3c079.chart" . }}
{{ include "go-echo5a48acce-604c-49ae-8064-98f726d3c079.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a48acce-604c-49ae-8064-98f726d3c079.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a48acce-604c-49ae-8064-98f726d3c079.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}