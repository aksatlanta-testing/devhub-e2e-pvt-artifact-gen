
{{- define "go-echoa4371129-075e-44d6-8d50-8798daa45eef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4371129-075e-44d6-8d50-8798daa45eef.fullname" -}}
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


{{- define "go-echoa4371129-075e-44d6-8d50-8798daa45eef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4371129-075e-44d6-8d50-8798daa45eef.labels" -}}
helm.sh/chart: {{ include "go-echoa4371129-075e-44d6-8d50-8798daa45eef.chart" . }}
{{ include "go-echoa4371129-075e-44d6-8d50-8798daa45eef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4371129-075e-44d6-8d50-8798daa45eef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4371129-075e-44d6-8d50-8798daa45eef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}