
{{- define "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.fullname" -}}
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


{{- define "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.labels" -}}
helm.sh/chart: {{ include "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.chart" . }}
{{ include "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebcc4b67-03a7-42f9-bbd4-d176c98d41b8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}