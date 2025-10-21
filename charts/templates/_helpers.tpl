
{{- define "go-echodbddac14-df45-48ce-9b92-a14c87436083.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbddac14-df45-48ce-9b92-a14c87436083.fullname" -}}
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


{{- define "go-echodbddac14-df45-48ce-9b92-a14c87436083.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbddac14-df45-48ce-9b92-a14c87436083.labels" -}}
helm.sh/chart: {{ include "go-echodbddac14-df45-48ce-9b92-a14c87436083.chart" . }}
{{ include "go-echodbddac14-df45-48ce-9b92-a14c87436083.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodbddac14-df45-48ce-9b92-a14c87436083.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodbddac14-df45-48ce-9b92-a14c87436083.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}