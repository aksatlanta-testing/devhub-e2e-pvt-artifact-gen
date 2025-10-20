
{{- define "go-echod630006a-333e-4a31-927f-012ae0ce9090.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod630006a-333e-4a31-927f-012ae0ce9090.fullname" -}}
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


{{- define "go-echod630006a-333e-4a31-927f-012ae0ce9090.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod630006a-333e-4a31-927f-012ae0ce9090.labels" -}}
helm.sh/chart: {{ include "go-echod630006a-333e-4a31-927f-012ae0ce9090.chart" . }}
{{ include "go-echod630006a-333e-4a31-927f-012ae0ce9090.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod630006a-333e-4a31-927f-012ae0ce9090.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod630006a-333e-4a31-927f-012ae0ce9090.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}