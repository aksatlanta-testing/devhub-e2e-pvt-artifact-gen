
{{- define "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.fullname" -}}
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


{{- define "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.labels" -}}
helm.sh/chart: {{ include "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.chart" . }}
{{ include "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo00e6ef35-3fa5-48c7-816c-cd14f6cd78aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}