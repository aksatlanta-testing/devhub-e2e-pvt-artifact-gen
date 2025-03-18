
{{- define "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.fullname" -}}
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


{{- define "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.labels" -}}
helm.sh/chart: {{ include "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.chart" . }}
{{ include "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb46cb6c-00ec-47c9-84a4-5dbf9776c78b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}