
{{- define "go-echofaae2c61-8877-4611-b85d-6a90927345fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaae2c61-8877-4611-b85d-6a90927345fe.fullname" -}}
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


{{- define "go-echofaae2c61-8877-4611-b85d-6a90927345fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaae2c61-8877-4611-b85d-6a90927345fe.labels" -}}
helm.sh/chart: {{ include "go-echofaae2c61-8877-4611-b85d-6a90927345fe.chart" . }}
{{ include "go-echofaae2c61-8877-4611-b85d-6a90927345fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofaae2c61-8877-4611-b85d-6a90927345fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofaae2c61-8877-4611-b85d-6a90927345fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}