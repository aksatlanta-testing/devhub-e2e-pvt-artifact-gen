
{{- define "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.fullname" -}}
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


{{- define "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.labels" -}}
helm.sh/chart: {{ include "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.chart" . }}
{{ include "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ed7b44c-0548-47a4-9c1f-85d0a421c92c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}