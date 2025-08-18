
{{- define "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.fullname" -}}
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


{{- define "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.labels" -}}
helm.sh/chart: {{ include "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.chart" . }}
{{ include "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo850cc536-9404-43ca-ba3e-2bab3146cbcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}