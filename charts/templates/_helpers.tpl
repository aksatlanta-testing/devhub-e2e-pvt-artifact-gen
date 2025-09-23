
{{- define "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.fullname" -}}
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


{{- define "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.labels" -}}
helm.sh/chart: {{ include "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.chart" . }}
{{ include "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo940b7a97-e43d-4af2-8cfa-ae35732ef66f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}