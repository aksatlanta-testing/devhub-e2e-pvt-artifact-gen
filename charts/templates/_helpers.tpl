
{{- define "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.fullname" -}}
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


{{- define "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.labels" -}}
helm.sh/chart: {{ include "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.chart" . }}
{{ include "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8b50afaa-b0f5-47fc-8a9b-39008d995fca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}