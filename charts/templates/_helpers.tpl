
{{- define "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.fullname" -}}
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


{{- define "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.labels" -}}
helm.sh/chart: {{ include "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.chart" . }}
{{ include "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf279a7f-4aee-4ca8-b36a-f527caf905dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}