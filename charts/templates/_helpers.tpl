
{{- define "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.fullname" -}}
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


{{- define "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.labels" -}}
helm.sh/chart: {{ include "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.chart" . }}
{{ include "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefe2a9e8-a834-4e64-8496-20dc51e4f339.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}