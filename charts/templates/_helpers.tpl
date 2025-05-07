
{{- define "go-echo3102447b-d056-4980-8361-833df1be4cef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3102447b-d056-4980-8361-833df1be4cef.fullname" -}}
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


{{- define "go-echo3102447b-d056-4980-8361-833df1be4cef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3102447b-d056-4980-8361-833df1be4cef.labels" -}}
helm.sh/chart: {{ include "go-echo3102447b-d056-4980-8361-833df1be4cef.chart" . }}
{{ include "go-echo3102447b-d056-4980-8361-833df1be4cef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3102447b-d056-4980-8361-833df1be4cef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3102447b-d056-4980-8361-833df1be4cef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}