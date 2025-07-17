
{{- define "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.fullname" -}}
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


{{- define "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.labels" -}}
helm.sh/chart: {{ include "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.chart" . }}
{{ include "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8a18455b-b58e-417a-84af-642aedfb1ace.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}