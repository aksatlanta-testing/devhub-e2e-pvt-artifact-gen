
{{- define "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.fullname" -}}
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


{{- define "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.labels" -}}
helm.sh/chart: {{ include "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.chart" . }}
{{ include "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod89ccf58-1c8e-44ed-a8ac-d3bf3227ec76.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}