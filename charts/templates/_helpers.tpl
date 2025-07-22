
{{- define "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.fullname" -}}
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


{{- define "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.labels" -}}
helm.sh/chart: {{ include "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.chart" . }}
{{ include "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7be06b0-432c-45f1-b1d0-b62c2d62ddf5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}