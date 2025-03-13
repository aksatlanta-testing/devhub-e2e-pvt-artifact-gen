
{{- define "go-echobe40e727-513b-41cc-9140-ff661b29d963.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe40e727-513b-41cc-9140-ff661b29d963.fullname" -}}
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


{{- define "go-echobe40e727-513b-41cc-9140-ff661b29d963.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe40e727-513b-41cc-9140-ff661b29d963.labels" -}}
helm.sh/chart: {{ include "go-echobe40e727-513b-41cc-9140-ff661b29d963.chart" . }}
{{ include "go-echobe40e727-513b-41cc-9140-ff661b29d963.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe40e727-513b-41cc-9140-ff661b29d963.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe40e727-513b-41cc-9140-ff661b29d963.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}