
{{- define "go-echo47352804-a75a-47d2-8642-8d8a51409575.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47352804-a75a-47d2-8642-8d8a51409575.fullname" -}}
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


{{- define "go-echo47352804-a75a-47d2-8642-8d8a51409575.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47352804-a75a-47d2-8642-8d8a51409575.labels" -}}
helm.sh/chart: {{ include "go-echo47352804-a75a-47d2-8642-8d8a51409575.chart" . }}
{{ include "go-echo47352804-a75a-47d2-8642-8d8a51409575.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47352804-a75a-47d2-8642-8d8a51409575.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47352804-a75a-47d2-8642-8d8a51409575.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}