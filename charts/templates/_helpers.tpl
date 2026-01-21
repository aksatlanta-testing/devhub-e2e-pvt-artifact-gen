
{{- define "go-echoff68841c-6927-4415-b3ca-4afa37665359.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff68841c-6927-4415-b3ca-4afa37665359.fullname" -}}
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


{{- define "go-echoff68841c-6927-4415-b3ca-4afa37665359.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff68841c-6927-4415-b3ca-4afa37665359.labels" -}}
helm.sh/chart: {{ include "go-echoff68841c-6927-4415-b3ca-4afa37665359.chart" . }}
{{ include "go-echoff68841c-6927-4415-b3ca-4afa37665359.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff68841c-6927-4415-b3ca-4afa37665359.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff68841c-6927-4415-b3ca-4afa37665359.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}