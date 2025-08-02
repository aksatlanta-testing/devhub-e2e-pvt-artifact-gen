
{{- define "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.fullname" -}}
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


{{- define "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.labels" -}}
helm.sh/chart: {{ include "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.chart" . }}
{{ include "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41904e97-b2d5-4eef-9c9c-c00f5831419c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}