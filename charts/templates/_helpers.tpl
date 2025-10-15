
{{- define "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.fullname" -}}
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


{{- define "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.labels" -}}
helm.sh/chart: {{ include "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.chart" . }}
{{ include "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3c5c9322-da99-4886-9cc8-1be4de47ddac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}