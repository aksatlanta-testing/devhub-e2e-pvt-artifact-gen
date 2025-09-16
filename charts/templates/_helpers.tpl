
{{- define "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.fullname" -}}
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


{{- define "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.labels" -}}
helm.sh/chart: {{ include "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.chart" . }}
{{ include "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0b3e659-288e-4c26-8229-a2a8f1ab1de1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}