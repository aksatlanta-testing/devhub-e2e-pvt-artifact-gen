
{{- define "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.fullname" -}}
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


{{- define "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.labels" -}}
helm.sh/chart: {{ include "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.chart" . }}
{{ include "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca8edffe-17c2-4b99-9a6c-e268e22a245b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}