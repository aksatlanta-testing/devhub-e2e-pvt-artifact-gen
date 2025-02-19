
{{- define "go-echoae405452-f830-4cd1-b774-69a19113dc9b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae405452-f830-4cd1-b774-69a19113dc9b.fullname" -}}
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


{{- define "go-echoae405452-f830-4cd1-b774-69a19113dc9b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae405452-f830-4cd1-b774-69a19113dc9b.labels" -}}
helm.sh/chart: {{ include "go-echoae405452-f830-4cd1-b774-69a19113dc9b.chart" . }}
{{ include "go-echoae405452-f830-4cd1-b774-69a19113dc9b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae405452-f830-4cd1-b774-69a19113dc9b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae405452-f830-4cd1-b774-69a19113dc9b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}