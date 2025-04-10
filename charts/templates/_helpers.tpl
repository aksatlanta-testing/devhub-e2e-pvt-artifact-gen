
{{- define "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.fullname" -}}
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


{{- define "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.labels" -}}
helm.sh/chart: {{ include "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.chart" . }}
{{ include "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2e62d06-be84-4567-a5e3-66bdbf41e845.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}