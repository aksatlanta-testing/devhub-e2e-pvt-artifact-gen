
{{- define "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.fullname" -}}
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


{{- define "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.labels" -}}
helm.sh/chart: {{ include "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.chart" . }}
{{ include "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42f70917-10b5-4c5a-b7f8-84654fdef5ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}