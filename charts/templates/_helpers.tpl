
{{- define "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.fullname" -}}
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


{{- define "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.labels" -}}
helm.sh/chart: {{ include "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.chart" . }}
{{ include "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1cdb4b7-32d3-4001-a55c-d83d480884cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}