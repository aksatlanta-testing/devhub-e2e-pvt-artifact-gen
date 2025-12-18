
{{- define "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.fullname" -}}
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


{{- define "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.labels" -}}
helm.sh/chart: {{ include "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.chart" . }}
{{ include "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5125f5f-5d25-49e2-bee0-dad26c03853e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}