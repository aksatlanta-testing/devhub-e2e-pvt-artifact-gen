
{{- define "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.fullname" -}}
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


{{- define "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.labels" -}}
helm.sh/chart: {{ include "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.chart" . }}
{{ include "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01858cbe-5e5a-4536-82c3-9b2818851dca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}