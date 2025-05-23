
{{- define "go-echo60ea9b67-8622-467e-b508-5b20804c7001.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60ea9b67-8622-467e-b508-5b20804c7001.fullname" -}}
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


{{- define "go-echo60ea9b67-8622-467e-b508-5b20804c7001.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60ea9b67-8622-467e-b508-5b20804c7001.labels" -}}
helm.sh/chart: {{ include "go-echo60ea9b67-8622-467e-b508-5b20804c7001.chart" . }}
{{ include "go-echo60ea9b67-8622-467e-b508-5b20804c7001.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo60ea9b67-8622-467e-b508-5b20804c7001.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo60ea9b67-8622-467e-b508-5b20804c7001.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}