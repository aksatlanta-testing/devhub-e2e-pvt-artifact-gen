
{{- define "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.fullname" -}}
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


{{- define "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.labels" -}}
helm.sh/chart: {{ include "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.chart" . }}
{{ include "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2d2fa13-d172-4c0e-a1fc-f086649165bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}