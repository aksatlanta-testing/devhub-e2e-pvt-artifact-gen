
{{- define "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.fullname" -}}
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


{{- define "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.labels" -}}
helm.sh/chart: {{ include "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.chart" . }}
{{ include "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8314be2e-4a5c-4ceb-bb47-82500fc1b36b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}