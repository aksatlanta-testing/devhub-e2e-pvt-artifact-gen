
{{- define "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.fullname" -}}
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


{{- define "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.labels" -}}
helm.sh/chart: {{ include "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.chart" . }}
{{ include "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95f45725-9180-4564-a075-d0ce2b55bafa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}