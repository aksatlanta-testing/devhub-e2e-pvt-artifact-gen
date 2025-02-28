
{{- define "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.fullname" -}}
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


{{- define "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.labels" -}}
helm.sh/chart: {{ include "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.chart" . }}
{{ include "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo122350e6-cc1a-4d09-afe1-ab89d8e55acb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}