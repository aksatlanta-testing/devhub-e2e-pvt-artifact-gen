
{{- define "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.fullname" -}}
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


{{- define "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.labels" -}}
helm.sh/chart: {{ include "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.chart" . }}
{{ include "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a14c4a2-19c4-4916-b563-56d0d5c28abf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}