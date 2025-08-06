
{{- define "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.fullname" -}}
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


{{- define "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.labels" -}}
helm.sh/chart: {{ include "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.chart" . }}
{{ include "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4be1f4b0-132d-4190-8378-9bab60f622cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}