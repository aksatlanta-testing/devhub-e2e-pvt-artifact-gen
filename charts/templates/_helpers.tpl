
{{- define "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.fullname" -}}
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


{{- define "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.labels" -}}
helm.sh/chart: {{ include "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.chart" . }}
{{ include "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f49a62a-e3c6-456d-8722-dc873d7ab9fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}