
{{- define "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.fullname" -}}
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


{{- define "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.labels" -}}
helm.sh/chart: {{ include "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.chart" . }}
{{ include "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1e1de6e3-99e7-4eae-a9e2-9b2eda21274f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}