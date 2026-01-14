
{{- define "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.fullname" -}}
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


{{- define "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.labels" -}}
helm.sh/chart: {{ include "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.chart" . }}
{{ include "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaaaa6bad-f157-4735-b580-a4640f49dd07.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}