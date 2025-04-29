
{{- define "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.fullname" -}}
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


{{- define "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.labels" -}}
helm.sh/chart: {{ include "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.chart" . }}
{{ include "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb5abae9-d29f-40db-9d52-142caa16e650.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}