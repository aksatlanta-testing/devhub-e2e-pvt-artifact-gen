
{{- define "go-echod262ca44-3456-4254-a057-9a13f022f989.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod262ca44-3456-4254-a057-9a13f022f989.fullname" -}}
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


{{- define "go-echod262ca44-3456-4254-a057-9a13f022f989.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod262ca44-3456-4254-a057-9a13f022f989.labels" -}}
helm.sh/chart: {{ include "go-echod262ca44-3456-4254-a057-9a13f022f989.chart" . }}
{{ include "go-echod262ca44-3456-4254-a057-9a13f022f989.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod262ca44-3456-4254-a057-9a13f022f989.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod262ca44-3456-4254-a057-9a13f022f989.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}