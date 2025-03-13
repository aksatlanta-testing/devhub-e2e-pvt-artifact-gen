
{{- define "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.fullname" -}}
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


{{- define "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.labels" -}}
helm.sh/chart: {{ include "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.chart" . }}
{{ include "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc0ae6f0-4351-4bac-9691-5e19b1059378.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}