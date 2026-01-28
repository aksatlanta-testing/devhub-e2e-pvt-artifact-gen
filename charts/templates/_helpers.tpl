
{{- define "go-echobb382d03-6174-4027-834e-9d671320c0ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb382d03-6174-4027-834e-9d671320c0ab.fullname" -}}
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


{{- define "go-echobb382d03-6174-4027-834e-9d671320c0ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb382d03-6174-4027-834e-9d671320c0ab.labels" -}}
helm.sh/chart: {{ include "go-echobb382d03-6174-4027-834e-9d671320c0ab.chart" . }}
{{ include "go-echobb382d03-6174-4027-834e-9d671320c0ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb382d03-6174-4027-834e-9d671320c0ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb382d03-6174-4027-834e-9d671320c0ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}