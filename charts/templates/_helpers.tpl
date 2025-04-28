
{{- define "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.fullname" -}}
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


{{- define "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.labels" -}}
helm.sh/chart: {{ include "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.chart" . }}
{{ include "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf3ae36a-774e-4183-a713-583c1b9b7dcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}