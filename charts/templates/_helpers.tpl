
{{- define "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.fullname" -}}
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


{{- define "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.labels" -}}
helm.sh/chart: {{ include "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.chart" . }}
{{ include "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof77ed867-6435-4e9a-83d1-57a0f798a10a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}