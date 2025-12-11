
{{- define "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.fullname" -}}
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


{{- define "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.labels" -}}
helm.sh/chart: {{ include "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.chart" . }}
{{ include "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc56e2e1a-4547-48b5-930c-a4cf0a5b8e22.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}