
{{- define "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.fullname" -}}
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


{{- define "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.labels" -}}
helm.sh/chart: {{ include "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.chart" . }}
{{ include "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd97cce0-9800-4db1-96e5-14d18247c31b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}