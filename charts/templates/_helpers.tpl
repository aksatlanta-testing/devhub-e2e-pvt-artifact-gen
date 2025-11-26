
{{- define "go-echoba947898-4766-4dde-b960-2218b0a90faa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba947898-4766-4dde-b960-2218b0a90faa.fullname" -}}
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


{{- define "go-echoba947898-4766-4dde-b960-2218b0a90faa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba947898-4766-4dde-b960-2218b0a90faa.labels" -}}
helm.sh/chart: {{ include "go-echoba947898-4766-4dde-b960-2218b0a90faa.chart" . }}
{{ include "go-echoba947898-4766-4dde-b960-2218b0a90faa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba947898-4766-4dde-b960-2218b0a90faa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba947898-4766-4dde-b960-2218b0a90faa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}