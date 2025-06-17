
{{- define "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.fullname" -}}
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


{{- define "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.labels" -}}
helm.sh/chart: {{ include "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.chart" . }}
{{ include "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bee5086-d275-445e-a548-a6ba5e2a2e2c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}