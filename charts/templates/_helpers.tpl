
{{- define "go-echo384a7924-bf37-4237-b696-b849a951c62f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo384a7924-bf37-4237-b696-b849a951c62f.fullname" -}}
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


{{- define "go-echo384a7924-bf37-4237-b696-b849a951c62f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo384a7924-bf37-4237-b696-b849a951c62f.labels" -}}
helm.sh/chart: {{ include "go-echo384a7924-bf37-4237-b696-b849a951c62f.chart" . }}
{{ include "go-echo384a7924-bf37-4237-b696-b849a951c62f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo384a7924-bf37-4237-b696-b849a951c62f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo384a7924-bf37-4237-b696-b849a951c62f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}