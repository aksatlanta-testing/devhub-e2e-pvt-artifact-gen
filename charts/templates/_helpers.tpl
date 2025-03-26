
{{- define "go-echo157e9180-6525-4163-b87a-b50013cd1247.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo157e9180-6525-4163-b87a-b50013cd1247.fullname" -}}
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


{{- define "go-echo157e9180-6525-4163-b87a-b50013cd1247.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo157e9180-6525-4163-b87a-b50013cd1247.labels" -}}
helm.sh/chart: {{ include "go-echo157e9180-6525-4163-b87a-b50013cd1247.chart" . }}
{{ include "go-echo157e9180-6525-4163-b87a-b50013cd1247.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo157e9180-6525-4163-b87a-b50013cd1247.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo157e9180-6525-4163-b87a-b50013cd1247.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}