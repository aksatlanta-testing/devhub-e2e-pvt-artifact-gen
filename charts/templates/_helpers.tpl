
{{- define "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.fullname" -}}
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


{{- define "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.labels" -}}
helm.sh/chart: {{ include "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.chart" . }}
{{ include "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44a41e44-9766-4952-9a3c-c18a93f0b22e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}