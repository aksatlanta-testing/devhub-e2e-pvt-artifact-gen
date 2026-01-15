
{{- define "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.fullname" -}}
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


{{- define "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.labels" -}}
helm.sh/chart: {{ include "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.chart" . }}
{{ include "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa379c784-3dc1-473c-82e5-6b60cab88637.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}