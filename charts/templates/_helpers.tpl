
{{- define "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.fullname" -}}
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


{{- define "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.labels" -}}
helm.sh/chart: {{ include "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.chart" . }}
{{ include "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo441c4828-1dcb-4492-8159-3bd4033bfdef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}