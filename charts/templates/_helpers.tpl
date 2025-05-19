
{{- define "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.fullname" -}}
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


{{- define "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.labels" -}}
helm.sh/chart: {{ include "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.chart" . }}
{{ include "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo04e8b0ad-b3e2-469c-82f7-56a855ad50cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}