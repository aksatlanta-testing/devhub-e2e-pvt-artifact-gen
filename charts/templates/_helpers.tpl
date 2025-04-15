
{{- define "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.fullname" -}}
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


{{- define "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.labels" -}}
helm.sh/chart: {{ include "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.chart" . }}
{{ include "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo94917583-8cb3-4bcb-b90c-ab9a71576048.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}