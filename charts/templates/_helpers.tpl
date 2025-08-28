
{{- define "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.fullname" -}}
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


{{- define "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.labels" -}}
helm.sh/chart: {{ include "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.chart" . }}
{{ include "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2bcc2d2-8adc-4a50-819e-722db3b5f28b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}