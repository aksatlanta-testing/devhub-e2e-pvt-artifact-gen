
{{- define "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.fullname" -}}
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


{{- define "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.labels" -}}
helm.sh/chart: {{ include "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.chart" . }}
{{ include "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f1a9291-c5f6-41e7-adee-94533c2fc6dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}