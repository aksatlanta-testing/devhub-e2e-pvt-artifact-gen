
{{- define "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.fullname" -}}
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


{{- define "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.labels" -}}
helm.sh/chart: {{ include "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.chart" . }}
{{ include "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4f784b1-52fc-4d3c-9a55-d4d833d2826d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}