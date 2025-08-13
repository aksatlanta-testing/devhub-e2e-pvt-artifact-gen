
{{- define "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.fullname" -}}
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


{{- define "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.labels" -}}
helm.sh/chart: {{ include "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.chart" . }}
{{ include "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31aeaba7-2af3-4174-9a72-472c2149510a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}