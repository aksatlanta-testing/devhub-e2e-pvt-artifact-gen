
{{- define "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.fullname" -}}
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


{{- define "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.labels" -}}
helm.sh/chart: {{ include "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.chart" . }}
{{ include "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod951f6cf-b9c4-4320-84a2-984b1db4312d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}