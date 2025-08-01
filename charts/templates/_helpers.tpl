
{{- define "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.fullname" -}}
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


{{- define "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.labels" -}}
helm.sh/chart: {{ include "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.chart" . }}
{{ include "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe793d571-1dcf-47b4-9046-dc6c66b0ab33.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}