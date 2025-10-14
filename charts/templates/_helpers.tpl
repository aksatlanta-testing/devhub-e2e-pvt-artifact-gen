
{{- define "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.fullname" -}}
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


{{- define "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.labels" -}}
helm.sh/chart: {{ include "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.chart" . }}
{{ include "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb7ff402-4eba-462d-9a01-9cace05efb45.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}