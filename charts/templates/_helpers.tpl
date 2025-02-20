
{{- define "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.fullname" -}}
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


{{- define "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.labels" -}}
helm.sh/chart: {{ include "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.chart" . }}
{{ include "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d366309-759f-4b96-b94f-ff0f270210fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}