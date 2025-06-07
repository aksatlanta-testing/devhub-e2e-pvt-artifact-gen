
{{- define "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.fullname" -}}
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


{{- define "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.labels" -}}
helm.sh/chart: {{ include "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.chart" . }}
{{ include "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7dec1f3-4b7e-45cd-bf8b-d69a73dc0699.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}