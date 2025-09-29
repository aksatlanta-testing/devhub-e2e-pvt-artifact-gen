
{{- define "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.fullname" -}}
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


{{- define "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.labels" -}}
helm.sh/chart: {{ include "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.chart" . }}
{{ include "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec7d040b-79fb-4ebd-af52-4379f0c11f01.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}