
{{- define "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.fullname" -}}
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


{{- define "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.labels" -}}
helm.sh/chart: {{ include "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.chart" . }}
{{ include "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb05bd7e-0079-43cd-a791-9282f5e78954.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}