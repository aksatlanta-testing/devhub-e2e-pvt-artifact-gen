
{{- define "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.fullname" -}}
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


{{- define "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.labels" -}}
helm.sh/chart: {{ include "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.chart" . }}
{{ include "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9a0853c-9c38-42ef-ac09-66d6dd3195ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}