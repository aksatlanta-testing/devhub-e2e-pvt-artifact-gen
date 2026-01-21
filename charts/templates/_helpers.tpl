
{{- define "go-echo069306d2-8825-40d6-8d42-55897ab5476c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo069306d2-8825-40d6-8d42-55897ab5476c.fullname" -}}
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


{{- define "go-echo069306d2-8825-40d6-8d42-55897ab5476c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo069306d2-8825-40d6-8d42-55897ab5476c.labels" -}}
helm.sh/chart: {{ include "go-echo069306d2-8825-40d6-8d42-55897ab5476c.chart" . }}
{{ include "go-echo069306d2-8825-40d6-8d42-55897ab5476c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo069306d2-8825-40d6-8d42-55897ab5476c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo069306d2-8825-40d6-8d42-55897ab5476c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}