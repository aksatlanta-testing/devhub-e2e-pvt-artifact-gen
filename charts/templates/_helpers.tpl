
{{- define "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.fullname" -}}
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


{{- define "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.labels" -}}
helm.sh/chart: {{ include "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.chart" . }}
{{ include "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe7ae2dd-82e2-4292-8e1d-7ec181f0504a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}