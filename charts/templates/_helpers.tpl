
{{- define "go-echodf094614-7143-4002-a196-7186585a2eac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf094614-7143-4002-a196-7186585a2eac.fullname" -}}
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


{{- define "go-echodf094614-7143-4002-a196-7186585a2eac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf094614-7143-4002-a196-7186585a2eac.labels" -}}
helm.sh/chart: {{ include "go-echodf094614-7143-4002-a196-7186585a2eac.chart" . }}
{{ include "go-echodf094614-7143-4002-a196-7186585a2eac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf094614-7143-4002-a196-7186585a2eac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf094614-7143-4002-a196-7186585a2eac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}