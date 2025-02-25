
{{- define "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.fullname" -}}
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


{{- define "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.labels" -}}
helm.sh/chart: {{ include "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.chart" . }}
{{ include "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac74d0e5-00c8-45a9-a3c5-7d7af2e6dedf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}