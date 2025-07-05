
{{- define "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.fullname" -}}
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


{{- define "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.labels" -}}
helm.sh/chart: {{ include "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.chart" . }}
{{ include "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob25a1e45-f558-4b14-8640-e3f361fd69ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}