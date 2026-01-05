
{{- define "go-echof68bfdfc-e76c-4169-a023-3302d6241565.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof68bfdfc-e76c-4169-a023-3302d6241565.fullname" -}}
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


{{- define "go-echof68bfdfc-e76c-4169-a023-3302d6241565.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof68bfdfc-e76c-4169-a023-3302d6241565.labels" -}}
helm.sh/chart: {{ include "go-echof68bfdfc-e76c-4169-a023-3302d6241565.chart" . }}
{{ include "go-echof68bfdfc-e76c-4169-a023-3302d6241565.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof68bfdfc-e76c-4169-a023-3302d6241565.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof68bfdfc-e76c-4169-a023-3302d6241565.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}