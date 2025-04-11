
{{- define "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.fullname" -}}
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


{{- define "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.labels" -}}
helm.sh/chart: {{ include "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.chart" . }}
{{ include "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4ca16f7-1dd7-43ca-828c-bea41b7e2124.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}