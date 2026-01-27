
{{- define "go-echoaca5f611-bb8e-449c-986b-695002c88bad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaca5f611-bb8e-449c-986b-695002c88bad.fullname" -}}
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


{{- define "go-echoaca5f611-bb8e-449c-986b-695002c88bad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaca5f611-bb8e-449c-986b-695002c88bad.labels" -}}
helm.sh/chart: {{ include "go-echoaca5f611-bb8e-449c-986b-695002c88bad.chart" . }}
{{ include "go-echoaca5f611-bb8e-449c-986b-695002c88bad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaca5f611-bb8e-449c-986b-695002c88bad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaca5f611-bb8e-449c-986b-695002c88bad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}