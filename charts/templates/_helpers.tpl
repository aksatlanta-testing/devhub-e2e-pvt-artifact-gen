
{{- define "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.fullname" -}}
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


{{- define "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.labels" -}}
helm.sh/chart: {{ include "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.chart" . }}
{{ include "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo824027a3-2b2a-4e5e-a1b2-a130107305da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}