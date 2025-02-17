
{{- define "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.fullname" -}}
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


{{- define "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.labels" -}}
helm.sh/chart: {{ include "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.chart" . }}
{{ include "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5eca595-abc9-4ae8-89f5-b0fdc3a8e6ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}