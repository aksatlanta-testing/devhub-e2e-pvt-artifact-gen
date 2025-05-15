
{{- define "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.fullname" -}}
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


{{- define "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.labels" -}}
helm.sh/chart: {{ include "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.chart" . }}
{{ include "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1acd8dcf-5690-420a-8c31-bba64b54033c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}