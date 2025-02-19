
{{- define "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.fullname" -}}
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


{{- define "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.labels" -}}
helm.sh/chart: {{ include "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.chart" . }}
{{ include "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo538d0804-17f0-43cf-865a-2086e5ba6675.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}