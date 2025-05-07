
{{- define "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.fullname" -}}
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


{{- define "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.labels" -}}
helm.sh/chart: {{ include "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.chart" . }}
{{ include "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd24e381-25af-4cd7-b605-bddcfca616e6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}