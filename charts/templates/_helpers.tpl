
{{- define "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.fullname" -}}
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


{{- define "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.labels" -}}
helm.sh/chart: {{ include "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.chart" . }}
{{ include "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9c266f4-d1a1-4d97-b20a-d99fa874107e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}