
{{- define "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.fullname" -}}
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


{{- define "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.labels" -}}
helm.sh/chart: {{ include "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.chart" . }}
{{ include "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd0b5c7c-2880-4d0a-924d-02e9afc5da9b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}