
{{- define "go-echoae41acab-70e1-471d-b4c8-5088623ac474.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae41acab-70e1-471d-b4c8-5088623ac474.fullname" -}}
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


{{- define "go-echoae41acab-70e1-471d-b4c8-5088623ac474.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae41acab-70e1-471d-b4c8-5088623ac474.labels" -}}
helm.sh/chart: {{ include "go-echoae41acab-70e1-471d-b4c8-5088623ac474.chart" . }}
{{ include "go-echoae41acab-70e1-471d-b4c8-5088623ac474.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae41acab-70e1-471d-b4c8-5088623ac474.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae41acab-70e1-471d-b4c8-5088623ac474.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}