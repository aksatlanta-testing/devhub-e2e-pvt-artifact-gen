
{{- define "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.fullname" -}}
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


{{- define "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.labels" -}}
helm.sh/chart: {{ include "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.chart" . }}
{{ include "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdf309eb-3d3b-41c6-9418-caa996302d79.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}