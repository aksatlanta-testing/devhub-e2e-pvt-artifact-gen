
{{- define "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.fullname" -}}
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


{{- define "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.labels" -}}
helm.sh/chart: {{ include "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.chart" . }}
{{ include "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6697570-1901-45cf-b006-25aa7c2e3d0a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}