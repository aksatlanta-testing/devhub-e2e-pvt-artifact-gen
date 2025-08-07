
{{- define "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.fullname" -}}
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


{{- define "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.labels" -}}
helm.sh/chart: {{ include "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.chart" . }}
{{ include "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffd5b6b1-f33e-457e-b150-33f28c402741.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}