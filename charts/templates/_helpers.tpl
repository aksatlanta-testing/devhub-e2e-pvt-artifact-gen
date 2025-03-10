
{{- define "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.fullname" -}}
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


{{- define "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.labels" -}}
helm.sh/chart: {{ include "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.chart" . }}
{{ include "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo00357c52-78ca-4d36-b716-395dbcc33b9f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}