
{{- define "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.fullname" -}}
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


{{- define "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.labels" -}}
helm.sh/chart: {{ include "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.chart" . }}
{{ include "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc78871b7-63a2-4b06-a10c-9fcf33f08e1b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}