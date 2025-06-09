
{{- define "go-echob90c9e10-a691-4861-948e-b0e6f991968c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob90c9e10-a691-4861-948e-b0e6f991968c.fullname" -}}
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


{{- define "go-echob90c9e10-a691-4861-948e-b0e6f991968c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob90c9e10-a691-4861-948e-b0e6f991968c.labels" -}}
helm.sh/chart: {{ include "go-echob90c9e10-a691-4861-948e-b0e6f991968c.chart" . }}
{{ include "go-echob90c9e10-a691-4861-948e-b0e6f991968c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob90c9e10-a691-4861-948e-b0e6f991968c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob90c9e10-a691-4861-948e-b0e6f991968c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}