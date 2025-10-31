
{{- define "go-echoa27e4952-f629-4f63-bae4-eb5151432548.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa27e4952-f629-4f63-bae4-eb5151432548.fullname" -}}
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


{{- define "go-echoa27e4952-f629-4f63-bae4-eb5151432548.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa27e4952-f629-4f63-bae4-eb5151432548.labels" -}}
helm.sh/chart: {{ include "go-echoa27e4952-f629-4f63-bae4-eb5151432548.chart" . }}
{{ include "go-echoa27e4952-f629-4f63-bae4-eb5151432548.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa27e4952-f629-4f63-bae4-eb5151432548.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa27e4952-f629-4f63-bae4-eb5151432548.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}