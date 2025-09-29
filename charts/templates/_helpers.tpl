
{{- define "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.fullname" -}}
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


{{- define "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.labels" -}}
helm.sh/chart: {{ include "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.chart" . }}
{{ include "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof9d1cd9d-f2f5-4f02-ad3c-ff1405a70278.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}