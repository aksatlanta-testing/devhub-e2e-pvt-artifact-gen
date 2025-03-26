
{{- define "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.fullname" -}}
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


{{- define "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.labels" -}}
helm.sh/chart: {{ include "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.chart" . }}
{{ include "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob478a0d7-3fea-40ad-95c5-2ec180ef5997.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}