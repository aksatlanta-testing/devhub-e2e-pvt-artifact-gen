
{{- define "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.fullname" -}}
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


{{- define "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.labels" -}}
helm.sh/chart: {{ include "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.chart" . }}
{{ include "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd1329ff-bc90-4367-86d0-6976adc8e8bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}