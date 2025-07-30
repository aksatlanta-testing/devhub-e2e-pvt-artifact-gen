
{{- define "go-echo335de2b7-009d-414a-8805-e857f48e9846.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo335de2b7-009d-414a-8805-e857f48e9846.fullname" -}}
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


{{- define "go-echo335de2b7-009d-414a-8805-e857f48e9846.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo335de2b7-009d-414a-8805-e857f48e9846.labels" -}}
helm.sh/chart: {{ include "go-echo335de2b7-009d-414a-8805-e857f48e9846.chart" . }}
{{ include "go-echo335de2b7-009d-414a-8805-e857f48e9846.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo335de2b7-009d-414a-8805-e857f48e9846.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo335de2b7-009d-414a-8805-e857f48e9846.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}