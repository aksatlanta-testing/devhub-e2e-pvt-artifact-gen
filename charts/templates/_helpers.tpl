
{{- define "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.fullname" -}}
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


{{- define "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.labels" -}}
helm.sh/chart: {{ include "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.chart" . }}
{{ include "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7f6a27f3-f3b1-48c3-bff5-a55a54f30917.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}