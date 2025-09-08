
{{- define "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.fullname" -}}
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


{{- define "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.labels" -}}
helm.sh/chart: {{ include "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.chart" . }}
{{ include "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe22a3f9-e5b3-4081-8f77-af503cd6f7a8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}