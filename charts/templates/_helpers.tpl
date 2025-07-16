
{{- define "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.fullname" -}}
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


{{- define "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.labels" -}}
helm.sh/chart: {{ include "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.chart" . }}
{{ include "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa43a732d-d87d-4886-8ccf-5b38089be6ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}