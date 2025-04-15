
{{- define "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.fullname" -}}
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


{{- define "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.labels" -}}
helm.sh/chart: {{ include "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.chart" . }}
{{ include "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32e63958-7ea7-4dd3-b6f1-a5c0200911ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}