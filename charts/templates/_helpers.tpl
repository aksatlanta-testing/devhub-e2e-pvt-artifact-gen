
{{- define "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.fullname" -}}
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


{{- define "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.labels" -}}
helm.sh/chart: {{ include "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.chart" . }}
{{ include "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaec84f9a-c9d8-42d8-a558-f70e37970876.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}