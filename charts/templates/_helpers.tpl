
{{- define "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.fullname" -}}
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


{{- define "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.labels" -}}
helm.sh/chart: {{ include "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.chart" . }}
{{ include "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo294e02a4-f8c1-4aa2-8b34-021e2f3b052d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}