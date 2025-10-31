
{{- define "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.fullname" -}}
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


{{- define "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.labels" -}}
helm.sh/chart: {{ include "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.chart" . }}
{{ include "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4d25aaf-b616-4ee8-a72c-039af07f189a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}