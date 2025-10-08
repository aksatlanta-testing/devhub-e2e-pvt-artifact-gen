
{{- define "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.fullname" -}}
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


{{- define "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.labels" -}}
helm.sh/chart: {{ include "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.chart" . }}
{{ include "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32386d5f-acb7-4585-9e91-6c6a72df304b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}