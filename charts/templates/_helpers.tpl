
{{- define "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.fullname" -}}
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


{{- define "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.labels" -}}
helm.sh/chart: {{ include "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.chart" . }}
{{ include "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo735583fe-1e9d-4f7c-8d84-c12cf4cc91af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}