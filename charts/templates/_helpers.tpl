
{{- define "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.fullname" -}}
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


{{- define "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.labels" -}}
helm.sh/chart: {{ include "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.chart" . }}
{{ include "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4d565aae-70f7-490a-aaa8-a6a8f7c10413.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}