
{{- define "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.fullname" -}}
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


{{- define "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.labels" -}}
helm.sh/chart: {{ include "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.chart" . }}
{{ include "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0be3893-caff-4d4d-815e-481cee1dbc1c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}