
{{- define "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.fullname" -}}
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


{{- define "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.labels" -}}
helm.sh/chart: {{ include "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.chart" . }}
{{ include "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0b634f8-f597-4315-8130-6b3775f3446f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}