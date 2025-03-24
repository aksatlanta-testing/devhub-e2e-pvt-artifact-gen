
{{- define "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.fullname" -}}
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


{{- define "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.labels" -}}
helm.sh/chart: {{ include "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.chart" . }}
{{ include "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd1982d5-8c6b-4fba-9e14-2d1f1c63efbe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}