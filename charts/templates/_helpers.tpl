
{{- define "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.fullname" -}}
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


{{- define "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.labels" -}}
helm.sh/chart: {{ include "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.chart" . }}
{{ include "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof129fa2d-0822-4cbd-a0ea-44e47df0bca2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}