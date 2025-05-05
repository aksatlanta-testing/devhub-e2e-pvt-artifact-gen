
{{- define "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.fullname" -}}
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


{{- define "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.labels" -}}
helm.sh/chart: {{ include "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.chart" . }}
{{ include "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdd8148f-3b1d-4899-b44c-a129e6694224.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}