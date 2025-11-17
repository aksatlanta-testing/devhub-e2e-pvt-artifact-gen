
{{- define "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.fullname" -}}
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


{{- define "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.labels" -}}
helm.sh/chart: {{ include "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.chart" . }}
{{ include "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed8213fd-9e08-46f7-895d-f1b86d43916c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}