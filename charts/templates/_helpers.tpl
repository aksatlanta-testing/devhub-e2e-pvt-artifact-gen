
{{- define "go-echoc19de613-d959-4056-baa8-9315bd29ee93.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc19de613-d959-4056-baa8-9315bd29ee93.fullname" -}}
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


{{- define "go-echoc19de613-d959-4056-baa8-9315bd29ee93.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc19de613-d959-4056-baa8-9315bd29ee93.labels" -}}
helm.sh/chart: {{ include "go-echoc19de613-d959-4056-baa8-9315bd29ee93.chart" . }}
{{ include "go-echoc19de613-d959-4056-baa8-9315bd29ee93.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc19de613-d959-4056-baa8-9315bd29ee93.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc19de613-d959-4056-baa8-9315bd29ee93.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}