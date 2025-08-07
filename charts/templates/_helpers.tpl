
{{- define "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.fullname" -}}
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


{{- define "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.labels" -}}
helm.sh/chart: {{ include "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.chart" . }}
{{ include "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc0c1ab0-5dcd-447a-96d3-509b965203aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}