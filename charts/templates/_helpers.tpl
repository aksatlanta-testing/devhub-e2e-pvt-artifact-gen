
{{- define "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.fullname" -}}
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


{{- define "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.labels" -}}
helm.sh/chart: {{ include "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.chart" . }}
{{ include "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo555caf3e-b38d-476c-9c7f-105fd1719edc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}