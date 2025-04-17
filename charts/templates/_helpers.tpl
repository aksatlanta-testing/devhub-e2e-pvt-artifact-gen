
{{- define "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.fullname" -}}
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


{{- define "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.labels" -}}
helm.sh/chart: {{ include "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.chart" . }}
{{ include "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda67a0a3-0caf-4885-b2e3-aac246fa543c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}