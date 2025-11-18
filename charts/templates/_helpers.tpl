
{{- define "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.fullname" -}}
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


{{- define "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.labels" -}}
helm.sh/chart: {{ include "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.chart" . }}
{{ include "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8a2beeb-37a6-4069-a650-a2f48ac3d608.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}