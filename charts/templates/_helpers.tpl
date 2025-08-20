
{{- define "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.fullname" -}}
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


{{- define "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.labels" -}}
helm.sh/chart: {{ include "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.chart" . }}
{{ include "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa532d33d-cc65-4e5f-8bf3-e0b04596464d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}