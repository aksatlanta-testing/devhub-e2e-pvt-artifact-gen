
{{- define "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.fullname" -}}
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


{{- define "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.labels" -}}
helm.sh/chart: {{ include "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.chart" . }}
{{ include "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob62a5be8-5ce6-4a6a-8429-9f2859f86d2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}