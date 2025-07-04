
{{- define "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.fullname" -}}
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


{{- define "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.labels" -}}
helm.sh/chart: {{ include "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.chart" . }}
{{ include "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo36b4969a-4f0a-4dbe-ab7f-a7c0ccb680ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}