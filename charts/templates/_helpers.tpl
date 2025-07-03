
{{- define "go-echo58783171-1b35-451c-a20f-3818088416ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58783171-1b35-451c-a20f-3818088416ad.fullname" -}}
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


{{- define "go-echo58783171-1b35-451c-a20f-3818088416ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo58783171-1b35-451c-a20f-3818088416ad.labels" -}}
helm.sh/chart: {{ include "go-echo58783171-1b35-451c-a20f-3818088416ad.chart" . }}
{{ include "go-echo58783171-1b35-451c-a20f-3818088416ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo58783171-1b35-451c-a20f-3818088416ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo58783171-1b35-451c-a20f-3818088416ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}