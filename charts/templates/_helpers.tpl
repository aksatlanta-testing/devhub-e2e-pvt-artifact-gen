
{{- define "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.fullname" -}}
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


{{- define "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.labels" -}}
helm.sh/chart: {{ include "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.chart" . }}
{{ include "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc217be78-83b8-4a4e-a3a2-cde7dff8696c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}