
{{- define "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.fullname" -}}
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


{{- define "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.labels" -}}
helm.sh/chart: {{ include "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.chart" . }}
{{ include "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7bb8105-08f8-486f-9e5f-0a7b47a7b3ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}