
{{- define "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.fullname" -}}
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


{{- define "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.labels" -}}
helm.sh/chart: {{ include "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.chart" . }}
{{ include "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4568783b-97a9-4ac1-bfb7-7f2494cd9f6b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}