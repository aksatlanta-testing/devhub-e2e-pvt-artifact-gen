
{{- define "go-echodba075ca-4e94-4b8e-861a-1c259799c883.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba075ca-4e94-4b8e-861a-1c259799c883.fullname" -}}
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


{{- define "go-echodba075ca-4e94-4b8e-861a-1c259799c883.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba075ca-4e94-4b8e-861a-1c259799c883.labels" -}}
helm.sh/chart: {{ include "go-echodba075ca-4e94-4b8e-861a-1c259799c883.chart" . }}
{{ include "go-echodba075ca-4e94-4b8e-861a-1c259799c883.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodba075ca-4e94-4b8e-861a-1c259799c883.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodba075ca-4e94-4b8e-861a-1c259799c883.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}