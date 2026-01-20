
{{- define "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.fullname" -}}
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


{{- define "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.labels" -}}
helm.sh/chart: {{ include "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.chart" . }}
{{ include "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocff1dbca-f9b6-4172-9821-7ac9c6a7a85c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}