
{{- define "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.fullname" -}}
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


{{- define "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.labels" -}}
helm.sh/chart: {{ include "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.chart" . }}
{{ include "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo85aeb966-9b15-47e5-9488-6bd1710119bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}