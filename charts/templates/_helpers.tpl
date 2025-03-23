
{{- define "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.fullname" -}}
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


{{- define "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.labels" -}}
helm.sh/chart: {{ include "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.chart" . }}
{{ include "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5fe11e06-1d5f-4460-b5ab-d8780742a886.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}