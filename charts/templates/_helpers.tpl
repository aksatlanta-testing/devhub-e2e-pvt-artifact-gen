
{{- define "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.fullname" -}}
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


{{- define "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.labels" -}}
helm.sh/chart: {{ include "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.chart" . }}
{{ include "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae9f53d3-679d-4661-93c4-0ec051dbfad6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}