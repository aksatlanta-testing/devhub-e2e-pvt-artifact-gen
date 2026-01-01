
{{- define "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.fullname" -}}
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


{{- define "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.labels" -}}
helm.sh/chart: {{ include "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.chart" . }}
{{ include "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1e0bae6f-c0be-45c5-982b-94b7f50a2886.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}