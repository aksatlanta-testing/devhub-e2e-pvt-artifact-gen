
{{- define "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.fullname" -}}
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


{{- define "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.labels" -}}
helm.sh/chart: {{ include "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.chart" . }}
{{ include "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4de5720-9b2e-4f25-b82b-a5509363c5bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}