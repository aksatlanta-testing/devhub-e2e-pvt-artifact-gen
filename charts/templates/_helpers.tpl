
{{- define "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.fullname" -}}
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


{{- define "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.labels" -}}
helm.sh/chart: {{ include "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.chart" . }}
{{ include "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05cf43e3-37a7-4760-bd5d-9a9b49a41b9a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}