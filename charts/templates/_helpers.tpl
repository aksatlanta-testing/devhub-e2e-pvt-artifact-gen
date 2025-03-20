
{{- define "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.fullname" -}}
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


{{- define "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.labels" -}}
helm.sh/chart: {{ include "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.chart" . }}
{{ include "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod84579d2-5d4b-4d7e-8652-787f6f625f8b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}