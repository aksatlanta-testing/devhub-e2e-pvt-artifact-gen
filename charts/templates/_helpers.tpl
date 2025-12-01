
{{- define "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.fullname" -}}
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


{{- define "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.labels" -}}
helm.sh/chart: {{ include "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.chart" . }}
{{ include "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8e86931c-13fa-45b5-9a60-77dfca7bb88d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}