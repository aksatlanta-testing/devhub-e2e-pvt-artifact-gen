
{{- define "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.fullname" -}}
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


{{- define "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.labels" -}}
helm.sh/chart: {{ include "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.chart" . }}
{{ include "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo230cb6cb-8abc-4dca-b5cf-f4f35c10bece.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}