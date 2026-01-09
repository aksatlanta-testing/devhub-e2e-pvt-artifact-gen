
{{- define "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.fullname" -}}
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


{{- define "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.labels" -}}
helm.sh/chart: {{ include "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.chart" . }}
{{ include "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a0f2bba-ee44-425a-9dfc-7f632dedfd8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}