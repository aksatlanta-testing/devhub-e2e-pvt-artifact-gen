
{{- define "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.fullname" -}}
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


{{- define "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.labels" -}}
helm.sh/chart: {{ include "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.chart" . }}
{{ include "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo94f22983-6a6c-4fb4-8d26-39c3d464dfa5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}