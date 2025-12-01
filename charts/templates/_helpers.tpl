
{{- define "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.fullname" -}}
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


{{- define "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.labels" -}}
helm.sh/chart: {{ include "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.chart" . }}
{{ include "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5d0ecb0f-8e3c-4e93-843b-2a7ab23d82cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}