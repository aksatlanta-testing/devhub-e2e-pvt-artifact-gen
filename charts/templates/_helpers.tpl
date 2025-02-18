
{{- define "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.fullname" -}}
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


{{- define "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.labels" -}}
helm.sh/chart: {{ include "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.chart" . }}
{{ include "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc060fa5-8a9c-4855-bcc5-d925ca12e937.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}