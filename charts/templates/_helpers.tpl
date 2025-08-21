
{{- define "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.fullname" -}}
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


{{- define "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.labels" -}}
helm.sh/chart: {{ include "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.chart" . }}
{{ include "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecbb7311-1f8d-47c9-b030-305226e1bea2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}