
{{- define "go-echoedcae330-f07a-4082-a0af-d63980e74bef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedcae330-f07a-4082-a0af-d63980e74bef.fullname" -}}
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


{{- define "go-echoedcae330-f07a-4082-a0af-d63980e74bef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedcae330-f07a-4082-a0af-d63980e74bef.labels" -}}
helm.sh/chart: {{ include "go-echoedcae330-f07a-4082-a0af-d63980e74bef.chart" . }}
{{ include "go-echoedcae330-f07a-4082-a0af-d63980e74bef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedcae330-f07a-4082-a0af-d63980e74bef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedcae330-f07a-4082-a0af-d63980e74bef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}