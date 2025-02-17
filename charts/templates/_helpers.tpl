
{{- define "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.fullname" -}}
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


{{- define "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.labels" -}}
helm.sh/chart: {{ include "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.chart" . }}
{{ include "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe097cfed-28a5-4873-b8f6-0adbdf1dab52.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}