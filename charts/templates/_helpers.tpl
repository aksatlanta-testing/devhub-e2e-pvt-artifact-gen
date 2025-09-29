
{{- define "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.fullname" -}}
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


{{- define "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.labels" -}}
helm.sh/chart: {{ include "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.chart" . }}
{{ include "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbd0c402-bb7c-4f96-8e45-50ee11c849ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}