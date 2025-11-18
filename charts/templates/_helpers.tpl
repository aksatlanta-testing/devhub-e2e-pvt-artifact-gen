
{{- define "go-echo064b8278-7b94-4432-a380-4dcb180361aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo064b8278-7b94-4432-a380-4dcb180361aa.fullname" -}}
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


{{- define "go-echo064b8278-7b94-4432-a380-4dcb180361aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo064b8278-7b94-4432-a380-4dcb180361aa.labels" -}}
helm.sh/chart: {{ include "go-echo064b8278-7b94-4432-a380-4dcb180361aa.chart" . }}
{{ include "go-echo064b8278-7b94-4432-a380-4dcb180361aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo064b8278-7b94-4432-a380-4dcb180361aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo064b8278-7b94-4432-a380-4dcb180361aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}