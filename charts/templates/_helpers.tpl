
{{- define "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.fullname" -}}
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


{{- define "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.labels" -}}
helm.sh/chart: {{ include "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.chart" . }}
{{ include "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2553fe09-fa91-4dba-ab84-7788566d5582.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}