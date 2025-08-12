
{{- define "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.fullname" -}}
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


{{- define "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.labels" -}}
helm.sh/chart: {{ include "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.chart" . }}
{{ include "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc4072b3-f31b-4321-86c0-84a5eed96f32.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}