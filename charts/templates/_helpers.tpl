
{{- define "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.fullname" -}}
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


{{- define "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.labels" -}}
helm.sh/chart: {{ include "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.chart" . }}
{{ include "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc557b27-fa0f-4cce-aad5-3254f49fd46c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}