
{{- define "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.fullname" -}}
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


{{- define "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.labels" -}}
helm.sh/chart: {{ include "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.chart" . }}
{{ include "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbd17660-b71c-437f-b0a9-2e0366b46399.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}