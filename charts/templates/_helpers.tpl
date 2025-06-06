
{{- define "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.fullname" -}}
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


{{- define "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.labels" -}}
helm.sh/chart: {{ include "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.chart" . }}
{{ include "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafcab42a-a4f6-4f33-b73f-3cd79c3ec7fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}