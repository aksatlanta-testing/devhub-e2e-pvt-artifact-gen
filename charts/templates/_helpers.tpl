
{{- define "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.fullname" -}}
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


{{- define "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.labels" -}}
helm.sh/chart: {{ include "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.chart" . }}
{{ include "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaad9f4ac-1a17-4031-9f91-6d34726e7fb3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}