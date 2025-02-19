
{{- define "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.fullname" -}}
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


{{- define "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.labels" -}}
helm.sh/chart: {{ include "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.chart" . }}
{{ include "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c9eb3c4-bf92-4cc4-b66e-716bd95795be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}