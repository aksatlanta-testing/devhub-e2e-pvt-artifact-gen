
{{- define "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.fullname" -}}
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


{{- define "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.labels" -}}
helm.sh/chart: {{ include "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.chart" . }}
{{ include "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf1f9d8a-b171-4e47-ab72-9a7c5b9fdc81.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}