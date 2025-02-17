
{{- define "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.fullname" -}}
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


{{- define "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.labels" -}}
helm.sh/chart: {{ include "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.chart" . }}
{{ include "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb5d5f7e-2066-45af-819e-4f8bd1a8c500.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}