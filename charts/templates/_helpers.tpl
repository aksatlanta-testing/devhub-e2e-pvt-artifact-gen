
{{- define "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.fullname" -}}
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


{{- define "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.labels" -}}
helm.sh/chart: {{ include "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.chart" . }}
{{ include "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbc91539-d4eb-462d-b09d-db6c30b31f0f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}