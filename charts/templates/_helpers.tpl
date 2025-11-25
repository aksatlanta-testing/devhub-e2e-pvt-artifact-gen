
{{- define "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.fullname" -}}
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


{{- define "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.labels" -}}
helm.sh/chart: {{ include "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.chart" . }}
{{ include "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo67bb5b82-9812-4040-8b88-4f7e15625043.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}