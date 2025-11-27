
{{- define "go-echoee664806-098a-43b1-a794-9144f81a32ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee664806-098a-43b1-a794-9144f81a32ee.fullname" -}}
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


{{- define "go-echoee664806-098a-43b1-a794-9144f81a32ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee664806-098a-43b1-a794-9144f81a32ee.labels" -}}
helm.sh/chart: {{ include "go-echoee664806-098a-43b1-a794-9144f81a32ee.chart" . }}
{{ include "go-echoee664806-098a-43b1-a794-9144f81a32ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee664806-098a-43b1-a794-9144f81a32ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee664806-098a-43b1-a794-9144f81a32ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}