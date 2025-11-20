
{{- define "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.fullname" -}}
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


{{- define "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.labels" -}}
helm.sh/chart: {{ include "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.chart" . }}
{{ include "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc699e39a-912a-4c4b-8372-b86fc1a41fba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}