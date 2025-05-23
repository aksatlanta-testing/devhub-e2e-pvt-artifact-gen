
{{- define "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.fullname" -}}
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


{{- define "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.labels" -}}
helm.sh/chart: {{ include "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.chart" . }}
{{ include "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo39e0c21c-b9e2-4cea-b651-09540324f2ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}