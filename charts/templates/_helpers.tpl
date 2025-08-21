
{{- define "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.fullname" -}}
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


{{- define "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.labels" -}}
helm.sh/chart: {{ include "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.chart" . }}
{{ include "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18726f50-00d2-4c0e-8a59-28fc051ce34e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}