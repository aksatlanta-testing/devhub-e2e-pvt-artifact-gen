
{{- define "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.fullname" -}}
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


{{- define "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.labels" -}}
helm.sh/chart: {{ include "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.chart" . }}
{{ include "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa302419e-4aab-45c2-bffb-b55f0155bb39.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}