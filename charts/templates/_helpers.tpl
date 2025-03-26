
{{- define "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.fullname" -}}
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


{{- define "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.labels" -}}
helm.sh/chart: {{ include "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.chart" . }}
{{ include "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo73c22031-df97-4242-ba70-1e6c4ef2bf16.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}