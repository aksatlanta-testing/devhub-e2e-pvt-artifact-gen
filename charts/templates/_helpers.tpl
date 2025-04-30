
{{- define "go-echo913b8438-b364-4032-881d-dee7dff39350.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo913b8438-b364-4032-881d-dee7dff39350.fullname" -}}
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


{{- define "go-echo913b8438-b364-4032-881d-dee7dff39350.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo913b8438-b364-4032-881d-dee7dff39350.labels" -}}
helm.sh/chart: {{ include "go-echo913b8438-b364-4032-881d-dee7dff39350.chart" . }}
{{ include "go-echo913b8438-b364-4032-881d-dee7dff39350.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo913b8438-b364-4032-881d-dee7dff39350.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo913b8438-b364-4032-881d-dee7dff39350.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}