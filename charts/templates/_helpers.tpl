
{{- define "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.fullname" -}}
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


{{- define "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.labels" -}}
helm.sh/chart: {{ include "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.chart" . }}
{{ include "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49332a1a-c3b7-450d-8bf7-f99711e4f6cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}