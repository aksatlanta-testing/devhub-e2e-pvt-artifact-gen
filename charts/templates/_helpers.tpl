
{{- define "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.fullname" -}}
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


{{- define "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.labels" -}}
helm.sh/chart: {{ include "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.chart" . }}
{{ include "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9e0400f9-fc45-4885-901d-6ab4e0a04aed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}