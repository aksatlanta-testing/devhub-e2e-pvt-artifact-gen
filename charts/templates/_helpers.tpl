
{{- define "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.fullname" -}}
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


{{- define "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.labels" -}}
helm.sh/chart: {{ include "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.chart" . }}
{{ include "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeed02d8d-b649-4b32-a024-feba3c71ed9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}