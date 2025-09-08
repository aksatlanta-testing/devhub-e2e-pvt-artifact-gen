
{{- define "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.fullname" -}}
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


{{- define "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.labels" -}}
helm.sh/chart: {{ include "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.chart" . }}
{{ include "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo466311de-e71a-43e1-ac0d-103cd523bcca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}