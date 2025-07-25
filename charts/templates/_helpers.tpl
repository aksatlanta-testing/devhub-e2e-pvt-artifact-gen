
{{- define "go-echo8807f396-f661-450c-a951-2269f86b2fbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8807f396-f661-450c-a951-2269f86b2fbd.fullname" -}}
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


{{- define "go-echo8807f396-f661-450c-a951-2269f86b2fbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8807f396-f661-450c-a951-2269f86b2fbd.labels" -}}
helm.sh/chart: {{ include "go-echo8807f396-f661-450c-a951-2269f86b2fbd.chart" . }}
{{ include "go-echo8807f396-f661-450c-a951-2269f86b2fbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8807f396-f661-450c-a951-2269f86b2fbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8807f396-f661-450c-a951-2269f86b2fbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}