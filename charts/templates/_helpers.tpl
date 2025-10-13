
{{- define "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.fullname" -}}
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


{{- define "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.labels" -}}
helm.sh/chart: {{ include "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.chart" . }}
{{ include "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac2aad73-2fc4-4795-a396-409577f1c3eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}