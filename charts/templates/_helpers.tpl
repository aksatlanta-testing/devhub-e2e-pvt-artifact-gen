
{{- define "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.fullname" -}}
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


{{- define "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.labels" -}}
helm.sh/chart: {{ include "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.chart" . }}
{{ include "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda0cb0ab-f64a-4074-9a98-89c2bec2e209.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}