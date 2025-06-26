
{{- define "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.fullname" -}}
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


{{- define "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.labels" -}}
helm.sh/chart: {{ include "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.chart" . }}
{{ include "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2518887-5476-45ba-862d-1e9e378b7f96.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}