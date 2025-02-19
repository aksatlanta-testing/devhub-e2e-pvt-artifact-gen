
{{- define "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.fullname" -}}
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


{{- define "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.labels" -}}
helm.sh/chart: {{ include "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.chart" . }}
{{ include "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbfedd48-0ba2-4bf7-9372-47e409b83eed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}