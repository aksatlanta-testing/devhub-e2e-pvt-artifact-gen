
{{- define "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.fullname" -}}
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


{{- define "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.labels" -}}
helm.sh/chart: {{ include "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.chart" . }}
{{ include "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ad2f9ea-603c-4d51-a44c-839373ab0548.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}