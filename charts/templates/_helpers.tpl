
{{- define "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.fullname" -}}
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


{{- define "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.labels" -}}
helm.sh/chart: {{ include "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.chart" . }}
{{ include "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo698ddc27-8ea7-4caa-ad5d-132d4c8f5317.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}