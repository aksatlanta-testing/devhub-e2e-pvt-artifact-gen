
{{- define "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.fullname" -}}
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


{{- define "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.labels" -}}
helm.sh/chart: {{ include "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.chart" . }}
{{ include "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeba1a506-7692-4f3e-8ac1-2087400793bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}