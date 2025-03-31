
{{- define "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.fullname" -}}
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


{{- define "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.labels" -}}
helm.sh/chart: {{ include "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.chart" . }}
{{ include "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo678f7c83-d91d-40f3-8185-fa14e8771707.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}