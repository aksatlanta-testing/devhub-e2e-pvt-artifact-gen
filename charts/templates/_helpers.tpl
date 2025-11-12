
{{- define "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.fullname" -}}
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


{{- define "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.labels" -}}
helm.sh/chart: {{ include "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.chart" . }}
{{ include "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo81eb3030-5556-4da1-b9f2-49fab401fccd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}