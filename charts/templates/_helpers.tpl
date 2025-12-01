
{{- define "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.fullname" -}}
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


{{- define "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.labels" -}}
helm.sh/chart: {{ include "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.chart" . }}
{{ include "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo23fa5f33-9f9d-4994-a17b-2fe4e7579fbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}