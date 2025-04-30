
{{- define "go-echo413552d2-de46-4611-af53-533b85b489df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo413552d2-de46-4611-af53-533b85b489df.fullname" -}}
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


{{- define "go-echo413552d2-de46-4611-af53-533b85b489df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo413552d2-de46-4611-af53-533b85b489df.labels" -}}
helm.sh/chart: {{ include "go-echo413552d2-de46-4611-af53-533b85b489df.chart" . }}
{{ include "go-echo413552d2-de46-4611-af53-533b85b489df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo413552d2-de46-4611-af53-533b85b489df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo413552d2-de46-4611-af53-533b85b489df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}