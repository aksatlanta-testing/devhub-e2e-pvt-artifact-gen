
{{- define "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.fullname" -}}
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


{{- define "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.labels" -}}
helm.sh/chart: {{ include "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.chart" . }}
{{ include "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7662235-f53a-42b7-81b0-9f7bb2df85ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}