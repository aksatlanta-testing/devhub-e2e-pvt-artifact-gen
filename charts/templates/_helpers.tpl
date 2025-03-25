
{{- define "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.fullname" -}}
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


{{- define "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.labels" -}}
helm.sh/chart: {{ include "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.chart" . }}
{{ include "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f9313ff-aac6-4bc8-bd08-80b34a7613ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}