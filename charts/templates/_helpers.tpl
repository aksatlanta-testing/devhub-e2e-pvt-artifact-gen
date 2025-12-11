
{{- define "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.fullname" -}}
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


{{- define "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.labels" -}}
helm.sh/chart: {{ include "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.chart" . }}
{{ include "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e6025bd-fc1d-44a0-8a48-9a507806f275.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}