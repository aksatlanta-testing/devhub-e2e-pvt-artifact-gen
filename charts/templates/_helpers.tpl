
{{- define "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.fullname" -}}
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


{{- define "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.labels" -}}
helm.sh/chart: {{ include "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.chart" . }}
{{ include "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9514ac4d-2349-4fd0-8e0c-b5a0c983908f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}