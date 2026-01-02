
{{- define "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.fullname" -}}
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


{{- define "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.labels" -}}
helm.sh/chart: {{ include "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.chart" . }}
{{ include "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5c41452c-f921-4701-ac9f-9f9f9e04cbba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}