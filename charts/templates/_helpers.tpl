
{{- define "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.fullname" -}}
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


{{- define "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.labels" -}}
helm.sh/chart: {{ include "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.chart" . }}
{{ include "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2a2ad5c-b3d2-4ace-8e44-9a00fe6a490b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}