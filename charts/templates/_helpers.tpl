
{{- define "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.fullname" -}}
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


{{- define "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.labels" -}}
helm.sh/chart: {{ include "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.chart" . }}
{{ include "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd89e62b-5802-4be7-ae98-0e11b8e060dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}