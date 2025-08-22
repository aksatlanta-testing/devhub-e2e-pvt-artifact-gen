
{{- define "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.fullname" -}}
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


{{- define "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.labels" -}}
helm.sh/chart: {{ include "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.chart" . }}
{{ include "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo68da7405-2538-4e44-8ab3-dd84793a292f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}