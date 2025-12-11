
{{- define "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.fullname" -}}
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


{{- define "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.labels" -}}
helm.sh/chart: {{ include "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.chart" . }}
{{ include "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod81ddbde-c0fa-475d-b12b-c1d1e7d8e12e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}