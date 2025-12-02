
{{- define "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.fullname" -}}
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


{{- define "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.labels" -}}
helm.sh/chart: {{ include "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.chart" . }}
{{ include "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodac773a4-3cd3-4359-b7ca-af5c0cff5d0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}