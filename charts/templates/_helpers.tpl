
{{- define "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.fullname" -}}
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


{{- define "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.labels" -}}
helm.sh/chart: {{ include "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.chart" . }}
{{ include "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7149a984-8278-4f5a-a10d-8ebca051e52b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}