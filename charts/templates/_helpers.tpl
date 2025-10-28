
{{- define "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.fullname" -}}
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


{{- define "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.labels" -}}
helm.sh/chart: {{ include "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.chart" . }}
{{ include "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4a09b716-10c9-4451-973e-2cb5bf3a276c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}