
{{- define "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.fullname" -}}
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


{{- define "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.labels" -}}
helm.sh/chart: {{ include "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.chart" . }}
{{ include "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ed087f3-1fa1-4d39-aafa-2b83557398ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}