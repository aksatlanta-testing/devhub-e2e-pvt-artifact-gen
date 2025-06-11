
{{- define "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.fullname" -}}
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


{{- define "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.labels" -}}
helm.sh/chart: {{ include "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.chart" . }}
{{ include "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof89945bd-a039-4828-9a2c-0fe188e7da34.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}