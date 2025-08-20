
{{- define "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.fullname" -}}
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


{{- define "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.labels" -}}
helm.sh/chart: {{ include "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.chart" . }}
{{ include "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5eb33fa0-c548-4451-b166-36ed93dfb4bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}