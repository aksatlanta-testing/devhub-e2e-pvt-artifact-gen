
{{- define "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.fullname" -}}
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


{{- define "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.labels" -}}
helm.sh/chart: {{ include "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.chart" . }}
{{ include "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea9c42a5-08a8-4ec0-9c94-379a5d6a8bdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}