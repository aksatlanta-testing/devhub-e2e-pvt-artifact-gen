
{{- define "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.fullname" -}}
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


{{- define "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.labels" -}}
helm.sh/chart: {{ include "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.chart" . }}
{{ include "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo658b1e8c-d1e8-456c-8e0d-e20044e1aade.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}