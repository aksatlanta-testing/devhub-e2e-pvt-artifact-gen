
{{- define "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.fullname" -}}
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


{{- define "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.labels" -}}
helm.sh/chart: {{ include "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.chart" . }}
{{ include "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc29398ad-1b6e-45d6-b094-ba490412a185.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}