
{{- define "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.fullname" -}}
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


{{- define "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.labels" -}}
helm.sh/chart: {{ include "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.chart" . }}
{{ include "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49ee64a1-e961-4661-8e98-7af017ba96de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}