
{{- define "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.fullname" -}}
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


{{- define "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.labels" -}}
helm.sh/chart: {{ include "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.chart" . }}
{{ include "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf40dbc0-2f77-4c28-89b7-d462b5afd35d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}