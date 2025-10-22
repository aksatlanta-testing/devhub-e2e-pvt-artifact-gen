
{{- define "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.fullname" -}}
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


{{- define "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.labels" -}}
helm.sh/chart: {{ include "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.chart" . }}
{{ include "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa128a3ff-961f-4d97-aec6-caa8547ae93c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}