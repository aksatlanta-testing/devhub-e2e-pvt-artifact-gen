
{{- define "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.fullname" -}}
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


{{- define "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.labels" -}}
helm.sh/chart: {{ include "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.chart" . }}
{{ include "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof27aaf41-0b3b-44a6-b5da-0842872436af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}