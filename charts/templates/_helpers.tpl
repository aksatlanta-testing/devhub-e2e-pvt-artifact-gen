
{{- define "go-echoe849618b-2a79-40c0-8061-865089adcdfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe849618b-2a79-40c0-8061-865089adcdfc.fullname" -}}
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


{{- define "go-echoe849618b-2a79-40c0-8061-865089adcdfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe849618b-2a79-40c0-8061-865089adcdfc.labels" -}}
helm.sh/chart: {{ include "go-echoe849618b-2a79-40c0-8061-865089adcdfc.chart" . }}
{{ include "go-echoe849618b-2a79-40c0-8061-865089adcdfc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe849618b-2a79-40c0-8061-865089adcdfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe849618b-2a79-40c0-8061-865089adcdfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}