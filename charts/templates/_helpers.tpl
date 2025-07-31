
{{- define "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.fullname" -}}
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


{{- define "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.labels" -}}
helm.sh/chart: {{ include "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.chart" . }}
{{ include "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1066f1c6-b539-4b10-9e3f-8c205efb12ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}