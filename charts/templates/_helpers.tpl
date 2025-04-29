
{{- define "go-echoa437344f-3e36-453c-8a66-2245361c99b4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa437344f-3e36-453c-8a66-2245361c99b4.fullname" -}}
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


{{- define "go-echoa437344f-3e36-453c-8a66-2245361c99b4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa437344f-3e36-453c-8a66-2245361c99b4.labels" -}}
helm.sh/chart: {{ include "go-echoa437344f-3e36-453c-8a66-2245361c99b4.chart" . }}
{{ include "go-echoa437344f-3e36-453c-8a66-2245361c99b4.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa437344f-3e36-453c-8a66-2245361c99b4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa437344f-3e36-453c-8a66-2245361c99b4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}