
{{- define "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.fullname" -}}
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


{{- define "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.labels" -}}
helm.sh/chart: {{ include "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.chart" . }}
{{ include "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo19d8f9d2-54c6-4670-8096-e1a15e209bde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}