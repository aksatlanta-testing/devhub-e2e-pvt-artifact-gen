
{{- define "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.fullname" -}}
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


{{- define "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.labels" -}}
helm.sh/chart: {{ include "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.chart" . }}
{{ include "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd66db3b-ea3c-46f5-a3c3-5b3d86b7960a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}