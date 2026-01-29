
{{- define "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.fullname" -}}
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


{{- define "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.labels" -}}
helm.sh/chart: {{ include "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.chart" . }}
{{ include "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8fd5098-6a64-48c1-977f-826bd9632bab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}