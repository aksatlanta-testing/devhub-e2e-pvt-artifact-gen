
{{- define "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.fullname" -}}
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


{{- define "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.labels" -}}
helm.sh/chart: {{ include "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.chart" . }}
{{ include "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a01b1c2-4ebc-48c4-933a-37a71cb5c166.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}