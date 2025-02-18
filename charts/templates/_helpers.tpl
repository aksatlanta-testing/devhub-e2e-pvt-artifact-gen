
{{- define "go-echoaea616ba-79d0-4295-9782-848187ea51ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea616ba-79d0-4295-9782-848187ea51ea.fullname" -}}
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


{{- define "go-echoaea616ba-79d0-4295-9782-848187ea51ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaea616ba-79d0-4295-9782-848187ea51ea.labels" -}}
helm.sh/chart: {{ include "go-echoaea616ba-79d0-4295-9782-848187ea51ea.chart" . }}
{{ include "go-echoaea616ba-79d0-4295-9782-848187ea51ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaea616ba-79d0-4295-9782-848187ea51ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaea616ba-79d0-4295-9782-848187ea51ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}