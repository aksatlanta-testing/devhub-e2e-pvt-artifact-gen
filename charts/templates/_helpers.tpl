
{{- define "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.fullname" -}}
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


{{- define "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.labels" -}}
helm.sh/chart: {{ include "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.chart" . }}
{{ include "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe877fa15-c27a-4172-ae65-2df5ad0d660e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}