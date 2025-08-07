
{{- define "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.fullname" -}}
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


{{- define "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.labels" -}}
helm.sh/chart: {{ include "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.chart" . }}
{{ include "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8357b61-68e1-41b8-a8f7-ae434bfb7387.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}