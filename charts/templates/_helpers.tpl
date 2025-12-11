
{{- define "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.fullname" -}}
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


{{- define "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.labels" -}}
helm.sh/chart: {{ include "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.chart" . }}
{{ include "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9e6bf84-567d-4322-a5f1-2554903ddecb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}