
{{- define "go-echoce592261-a323-45e1-a95d-7275a1e441ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce592261-a323-45e1-a95d-7275a1e441ce.fullname" -}}
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


{{- define "go-echoce592261-a323-45e1-a95d-7275a1e441ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce592261-a323-45e1-a95d-7275a1e441ce.labels" -}}
helm.sh/chart: {{ include "go-echoce592261-a323-45e1-a95d-7275a1e441ce.chart" . }}
{{ include "go-echoce592261-a323-45e1-a95d-7275a1e441ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce592261-a323-45e1-a95d-7275a1e441ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce592261-a323-45e1-a95d-7275a1e441ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}