
{{- define "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.fullname" -}}
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


{{- define "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.labels" -}}
helm.sh/chart: {{ include "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.chart" . }}
{{ include "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0dc3474-9a85-41e2-bb85-0c0a6fa75d08.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}