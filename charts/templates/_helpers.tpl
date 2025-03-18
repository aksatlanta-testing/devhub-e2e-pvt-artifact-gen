
{{- define "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.fullname" -}}
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


{{- define "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.labels" -}}
helm.sh/chart: {{ include "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.chart" . }}
{{ include "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad727e8f-1ec8-4c77-a409-2893a963ad2d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}