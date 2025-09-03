
{{- define "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.fullname" -}}
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


{{- define "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.labels" -}}
helm.sh/chart: {{ include "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.chart" . }}
{{ include "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod13b07b7-cd3b-42b0-9066-184d429afbed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}