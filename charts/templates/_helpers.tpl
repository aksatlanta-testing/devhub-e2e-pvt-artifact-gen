
{{- define "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.fullname" -}}
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


{{- define "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.labels" -}}
helm.sh/chart: {{ include "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.chart" . }}
{{ include "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefd4feea-247f-40c8-94b7-1e11b103f095.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}