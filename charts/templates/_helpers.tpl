
{{- define "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.fullname" -}}
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


{{- define "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.labels" -}}
helm.sh/chart: {{ include "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.chart" . }}
{{ include "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo60c94c05-04b3-4f44-96f5-0f72cca1b79a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}