
{{- define "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.fullname" -}}
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


{{- define "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.labels" -}}
helm.sh/chart: {{ include "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.chart" . }}
{{ include "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf750a56-169d-44cc-9ede-a8fc142e0e0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}