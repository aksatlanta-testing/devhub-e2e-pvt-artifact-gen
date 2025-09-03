
{{- define "go-echoab511798-8181-48fc-81af-3a2247f76760.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab511798-8181-48fc-81af-3a2247f76760.fullname" -}}
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


{{- define "go-echoab511798-8181-48fc-81af-3a2247f76760.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab511798-8181-48fc-81af-3a2247f76760.labels" -}}
helm.sh/chart: {{ include "go-echoab511798-8181-48fc-81af-3a2247f76760.chart" . }}
{{ include "go-echoab511798-8181-48fc-81af-3a2247f76760.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab511798-8181-48fc-81af-3a2247f76760.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab511798-8181-48fc-81af-3a2247f76760.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}