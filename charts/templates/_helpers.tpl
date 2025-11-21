
{{- define "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.fullname" -}}
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


{{- define "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.labels" -}}
helm.sh/chart: {{ include "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.chart" . }}
{{ include "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8ddd3db5-52f4-4c89-b16e-39d4f72c5c7a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}