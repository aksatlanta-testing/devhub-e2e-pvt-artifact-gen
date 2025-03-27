
{{- define "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.fullname" -}}
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


{{- define "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.labels" -}}
helm.sh/chart: {{ include "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.chart" . }}
{{ include "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec88cc59-ad1c-4088-b66a-3024a8432faa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}