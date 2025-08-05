
{{- define "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.fullname" -}}
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


{{- define "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.labels" -}}
helm.sh/chart: {{ include "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.chart" . }}
{{ include "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd3cfa11-5e95-4f38-83fc-a95db44f2efd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}