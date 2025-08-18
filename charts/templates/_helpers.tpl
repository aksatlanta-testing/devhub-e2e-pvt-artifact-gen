
{{- define "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.fullname" -}}
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


{{- define "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.labels" -}}
helm.sh/chart: {{ include "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.chart" . }}
{{ include "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1dfb8ec-0e97-47f7-be4c-bc8736415593.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}