
{{- define "go-echofc91d097-ad06-48ea-958a-1920d7293882.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc91d097-ad06-48ea-958a-1920d7293882.fullname" -}}
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


{{- define "go-echofc91d097-ad06-48ea-958a-1920d7293882.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc91d097-ad06-48ea-958a-1920d7293882.labels" -}}
helm.sh/chart: {{ include "go-echofc91d097-ad06-48ea-958a-1920d7293882.chart" . }}
{{ include "go-echofc91d097-ad06-48ea-958a-1920d7293882.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc91d097-ad06-48ea-958a-1920d7293882.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc91d097-ad06-48ea-958a-1920d7293882.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}