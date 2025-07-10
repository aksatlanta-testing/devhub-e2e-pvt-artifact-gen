
{{- define "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.fullname" -}}
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


{{- define "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.labels" -}}
helm.sh/chart: {{ include "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.chart" . }}
{{ include "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod53f44a8-fbd2-4ba2-aa21-b9749995d784.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}