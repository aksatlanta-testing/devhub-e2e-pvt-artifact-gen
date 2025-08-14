
{{- define "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.fullname" -}}
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


{{- define "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.labels" -}}
helm.sh/chart: {{ include "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.chart" . }}
{{ include "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7127c76-fd0d-473f-bc9a-8f7446625685.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}