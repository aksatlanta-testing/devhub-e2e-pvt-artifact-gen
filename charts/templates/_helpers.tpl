
{{- define "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.fullname" -}}
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


{{- define "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.labels" -}}
helm.sh/chart: {{ include "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.chart" . }}
{{ include "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6683bca9-fdab-4002-8e32-1181fe46badd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}