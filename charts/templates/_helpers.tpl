
{{- define "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.fullname" -}}
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


{{- define "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.labels" -}}
helm.sh/chart: {{ include "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.chart" . }}
{{ include "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob4673e2d-a88c-4f83-af96-2a45ea738f4f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}