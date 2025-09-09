
{{- define "go-echodf29626b-3e33-4816-8908-78163fb9da55.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf29626b-3e33-4816-8908-78163fb9da55.fullname" -}}
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


{{- define "go-echodf29626b-3e33-4816-8908-78163fb9da55.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf29626b-3e33-4816-8908-78163fb9da55.labels" -}}
helm.sh/chart: {{ include "go-echodf29626b-3e33-4816-8908-78163fb9da55.chart" . }}
{{ include "go-echodf29626b-3e33-4816-8908-78163fb9da55.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf29626b-3e33-4816-8908-78163fb9da55.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf29626b-3e33-4816-8908-78163fb9da55.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}