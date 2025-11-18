
{{- define "go-echobdf7befc-f553-415d-9d1b-6be902337723.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdf7befc-f553-415d-9d1b-6be902337723.fullname" -}}
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


{{- define "go-echobdf7befc-f553-415d-9d1b-6be902337723.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdf7befc-f553-415d-9d1b-6be902337723.labels" -}}
helm.sh/chart: {{ include "go-echobdf7befc-f553-415d-9d1b-6be902337723.chart" . }}
{{ include "go-echobdf7befc-f553-415d-9d1b-6be902337723.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdf7befc-f553-415d-9d1b-6be902337723.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdf7befc-f553-415d-9d1b-6be902337723.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}