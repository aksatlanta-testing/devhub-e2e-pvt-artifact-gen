
{{- define "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.fullname" -}}
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


{{- define "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.labels" -}}
helm.sh/chart: {{ include "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.chart" . }}
{{ include "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobff8e82a-cecc-449e-a8bc-2a3f6ad14b4d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}