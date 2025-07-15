
{{- define "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.fullname" -}}
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


{{- define "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.labels" -}}
helm.sh/chart: {{ include "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.chart" . }}
{{ include "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo404aabd1-3bd8-4833-9f3a-030a5ff5e5af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}