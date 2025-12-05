
{{- define "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.fullname" -}}
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


{{- define "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.labels" -}}
helm.sh/chart: {{ include "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.chart" . }}
{{ include "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof831fbd5-707a-4c1a-b19e-89bf9a9ca1ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}