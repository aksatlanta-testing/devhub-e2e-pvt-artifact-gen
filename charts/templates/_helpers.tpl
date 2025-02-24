
{{- define "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.fullname" -}}
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


{{- define "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.labels" -}}
helm.sh/chart: {{ include "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.chart" . }}
{{ include "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob939a16d-3524-4628-9c3b-27a5e3491edd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}