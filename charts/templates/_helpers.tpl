
{{- define "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.fullname" -}}
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


{{- define "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.labels" -}}
helm.sh/chart: {{ include "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.chart" . }}
{{ include "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodac66ce5-5a70-4156-8c7d-8f3db3177358.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}