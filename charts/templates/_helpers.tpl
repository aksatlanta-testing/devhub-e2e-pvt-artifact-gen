
{{- define "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.fullname" -}}
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


{{- define "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.labels" -}}
helm.sh/chart: {{ include "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.chart" . }}
{{ include "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeebb66c0-71cd-4d30-a9dc-c0998c1c751b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}