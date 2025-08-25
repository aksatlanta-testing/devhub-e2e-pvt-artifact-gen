
{{- define "go-echo31e3f567-3c8c-429b-b62e-044a89388343.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31e3f567-3c8c-429b-b62e-044a89388343.fullname" -}}
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


{{- define "go-echo31e3f567-3c8c-429b-b62e-044a89388343.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31e3f567-3c8c-429b-b62e-044a89388343.labels" -}}
helm.sh/chart: {{ include "go-echo31e3f567-3c8c-429b-b62e-044a89388343.chart" . }}
{{ include "go-echo31e3f567-3c8c-429b-b62e-044a89388343.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31e3f567-3c8c-429b-b62e-044a89388343.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31e3f567-3c8c-429b-b62e-044a89388343.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}