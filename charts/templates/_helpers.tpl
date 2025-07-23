
{{- define "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.fullname" -}}
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


{{- define "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.labels" -}}
helm.sh/chart: {{ include "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.chart" . }}
{{ include "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb25a450-c2f3-4386-9d30-18b9bf04efbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}