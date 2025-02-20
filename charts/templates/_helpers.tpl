
{{- define "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.fullname" -}}
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


{{- define "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.labels" -}}
helm.sh/chart: {{ include "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.chart" . }}
{{ include "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac2bb82a-bc0b-4df4-a0e7-2d25e123c317.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}