
{{- define "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.fullname" -}}
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


{{- define "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.labels" -}}
helm.sh/chart: {{ include "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.chart" . }}
{{ include "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3644d74a-a77e-4b71-969b-d4e0a1804289.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}