
{{- define "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.fullname" -}}
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


{{- define "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.labels" -}}
helm.sh/chart: {{ include "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.chart" . }}
{{ include "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac553a31-9fc0-48c6-9e4f-b40ff219d21b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}