
{{- define "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.fullname" -}}
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


{{- define "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.labels" -}}
helm.sh/chart: {{ include "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.chart" . }}
{{ include "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8e5ffe06-4dfc-4ab0-8172-121100304caa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}