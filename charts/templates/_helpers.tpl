
{{- define "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.fullname" -}}
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


{{- define "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.labels" -}}
helm.sh/chart: {{ include "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.chart" . }}
{{ include "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47b58fc0-4e10-430d-8d90-523d9cbf790e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}