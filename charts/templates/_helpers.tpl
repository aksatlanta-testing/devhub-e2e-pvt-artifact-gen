
{{- define "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.fullname" -}}
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


{{- define "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.labels" -}}
helm.sh/chart: {{ include "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.chart" . }}
{{ include "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4a79069f-9604-46a7-9dbd-52fd25c46dfd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}