
{{- define "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.fullname" -}}
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


{{- define "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.labels" -}}
helm.sh/chart: {{ include "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.chart" . }}
{{ include "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5849c32-99cb-454b-9d3e-eb78f9655854.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}