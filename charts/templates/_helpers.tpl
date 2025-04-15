
{{- define "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.fullname" -}}
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


{{- define "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.labels" -}}
helm.sh/chart: {{ include "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.chart" . }}
{{ include "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo38663ff9-82f8-472c-8977-85b39fb3c8bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}