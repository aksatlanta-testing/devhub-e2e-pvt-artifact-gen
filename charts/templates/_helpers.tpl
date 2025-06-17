
{{- define "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.fullname" -}}
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


{{- define "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.labels" -}}
helm.sh/chart: {{ include "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.chart" . }}
{{ include "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62150722-8f48-4935-a5b3-bced4ee0e46b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}