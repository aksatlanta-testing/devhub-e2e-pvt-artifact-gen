
{{- define "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.fullname" -}}
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


{{- define "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.labels" -}}
helm.sh/chart: {{ include "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.chart" . }}
{{ include "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob666072c-234a-4d4a-b8c3-b5ad7ab85b31.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}