
{{- define "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.fullname" -}}
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


{{- define "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.labels" -}}
helm.sh/chart: {{ include "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.chart" . }}
{{ include "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3ce7be8-6241-4871-8b3b-bc7cf3713189.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}