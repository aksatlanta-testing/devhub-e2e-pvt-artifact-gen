
{{- define "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.fullname" -}}
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


{{- define "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.labels" -}}
helm.sh/chart: {{ include "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.chart" . }}
{{ include "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo061e7be8-33e1-4ca0-89f6-66370b8ea02b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}