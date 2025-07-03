
{{- define "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.fullname" -}}
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


{{- define "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.labels" -}}
helm.sh/chart: {{ include "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.chart" . }}
{{ include "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62cd431d-5b24-4395-9f8b-1b608f6e0cfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}