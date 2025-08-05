
{{- define "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.fullname" -}}
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


{{- define "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.labels" -}}
helm.sh/chart: {{ include "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.chart" . }}
{{ include "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod45fc407-609c-4e44-a842-c224ec7d1a36.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}