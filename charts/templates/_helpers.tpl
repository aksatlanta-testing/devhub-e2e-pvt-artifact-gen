
{{- define "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.fullname" -}}
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


{{- define "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.labels" -}}
helm.sh/chart: {{ include "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.chart" . }}
{{ include "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda62fd0f-c61b-40f1-af93-475d235ebc23.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}