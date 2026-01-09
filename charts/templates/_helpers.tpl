
{{- define "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.fullname" -}}
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


{{- define "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.labels" -}}
helm.sh/chart: {{ include "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.chart" . }}
{{ include "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3da04ed2-b9a0-4f85-aca8-76ad241b757d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}