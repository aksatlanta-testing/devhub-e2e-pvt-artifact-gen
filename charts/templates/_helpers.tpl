
{{- define "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.fullname" -}}
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


{{- define "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.labels" -}}
helm.sh/chart: {{ include "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.chart" . }}
{{ include "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ef89c16-a9ec-4c1a-9d4a-24511348c5bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}