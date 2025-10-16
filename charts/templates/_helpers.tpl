
{{- define "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.fullname" -}}
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


{{- define "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.labels" -}}
helm.sh/chart: {{ include "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.chart" . }}
{{ include "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a75fe8f-c99e-4690-8224-a28b19e75cba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}