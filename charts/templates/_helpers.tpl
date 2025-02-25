
{{- define "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.fullname" -}}
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


{{- define "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.labels" -}}
helm.sh/chart: {{ include "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.chart" . }}
{{ include "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc019b4ef-0414-4485-a919-2aed9a58fa10.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}