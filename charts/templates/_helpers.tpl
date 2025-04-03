
{{- define "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.fullname" -}}
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


{{- define "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.labels" -}}
helm.sh/chart: {{ include "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.chart" . }}
{{ include "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7090846b-cb45-46d8-9164-6f6db82d427b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}