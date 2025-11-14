
{{- define "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.fullname" -}}
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


{{- define "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.labels" -}}
helm.sh/chart: {{ include "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.chart" . }}
{{ include "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbff7da3-0234-41b3-b2e4-b2c6458cbf54.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}