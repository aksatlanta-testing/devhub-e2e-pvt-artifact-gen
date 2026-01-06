
{{- define "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.fullname" -}}
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


{{- define "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.labels" -}}
helm.sh/chart: {{ include "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.chart" . }}
{{ include "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee4c01ee-6b77-47f1-a558-2893f048dfa2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}