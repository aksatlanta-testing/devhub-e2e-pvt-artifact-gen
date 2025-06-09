
{{- define "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.fullname" -}}
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


{{- define "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.labels" -}}
helm.sh/chart: {{ include "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.chart" . }}
{{ include "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6f09f1e-7027-4154-8841-61cb0646aacf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}