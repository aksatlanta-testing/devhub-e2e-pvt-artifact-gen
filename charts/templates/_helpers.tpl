
{{- define "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.fullname" -}}
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


{{- define "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.labels" -}}
helm.sh/chart: {{ include "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.chart" . }}
{{ include "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo894508ce-6fce-4c77-aa39-1e83c0d505fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}