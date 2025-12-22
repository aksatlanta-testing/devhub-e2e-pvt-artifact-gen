
{{- define "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.fullname" -}}
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


{{- define "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.labels" -}}
helm.sh/chart: {{ include "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.chart" . }}
{{ include "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo486b2d98-b70a-4783-b0eb-f8c483185edb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}