
{{- define "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.fullname" -}}
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


{{- define "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.labels" -}}
helm.sh/chart: {{ include "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.chart" . }}
{{ include "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb97bbfd-b0f5-4cf0-a3d5-86bbfca31b81.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}