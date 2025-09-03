
{{- define "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.fullname" -}}
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


{{- define "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.labels" -}}
helm.sh/chart: {{ include "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.chart" . }}
{{ include "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoace2aff6-0d15-48ae-b2ea-f7220d7dc634.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}