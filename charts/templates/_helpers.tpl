
{{- define "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.fullname" -}}
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


{{- define "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.labels" -}}
helm.sh/chart: {{ include "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.chart" . }}
{{ include "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo30f0b080-27f1-4416-8ae0-12cfa8647529.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}