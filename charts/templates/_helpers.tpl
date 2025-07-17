
{{- define "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.fullname" -}}
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


{{- define "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.labels" -}}
helm.sh/chart: {{ include "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.chart" . }}
{{ include "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod30c87ba-7545-424a-8ac2-4ed345aef16c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}