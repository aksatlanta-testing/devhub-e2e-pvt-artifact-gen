
{{- define "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.fullname" -}}
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


{{- define "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.labels" -}}
helm.sh/chart: {{ include "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.chart" . }}
{{ include "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo51ca82de-7d93-4b0d-8a34-5233e64e32fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}