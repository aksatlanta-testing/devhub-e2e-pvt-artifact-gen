
{{- define "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.fullname" -}}
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


{{- define "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.labels" -}}
helm.sh/chart: {{ include "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.chart" . }}
{{ include "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15752d4b-b5b3-4752-b8ae-d3529a86b760.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}