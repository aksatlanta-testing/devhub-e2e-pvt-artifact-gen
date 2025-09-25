
{{- define "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.fullname" -}}
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


{{- define "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.labels" -}}
helm.sh/chart: {{ include "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.chart" . }}
{{ include "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodadf7427-1b1f-47d0-bb47-e54962aacc18.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}