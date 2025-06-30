
{{- define "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.fullname" -}}
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


{{- define "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.labels" -}}
helm.sh/chart: {{ include "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.chart" . }}
{{ include "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec9f0d83-45f5-4333-ae68-55073bb69519.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}