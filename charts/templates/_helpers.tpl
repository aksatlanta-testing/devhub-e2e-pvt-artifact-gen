
{{- define "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.fullname" -}}
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


{{- define "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.labels" -}}
helm.sh/chart: {{ include "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.chart" . }}
{{ include "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d76385d-4b2e-4607-b905-673aff5500ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}