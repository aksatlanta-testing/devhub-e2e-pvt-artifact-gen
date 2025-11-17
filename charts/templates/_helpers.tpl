
{{- define "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.fullname" -}}
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


{{- define "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.labels" -}}
helm.sh/chart: {{ include "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.chart" . }}
{{ include "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1e3229c-8116-4bd7-9825-a1db61677670.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}