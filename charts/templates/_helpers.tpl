
{{- define "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.fullname" -}}
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


{{- define "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.labels" -}}
helm.sh/chart: {{ include "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.chart" . }}
{{ include "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6dca4a8c-e1a1-4f15-95bf-2c2a968b7337.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}