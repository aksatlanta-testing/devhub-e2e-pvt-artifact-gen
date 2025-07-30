
{{- define "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.fullname" -}}
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


{{- define "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.labels" -}}
helm.sh/chart: {{ include "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.chart" . }}
{{ include "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e73f00e-fbd6-46d6-a446-5942d4432661.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}