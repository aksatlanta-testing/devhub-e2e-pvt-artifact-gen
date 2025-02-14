
{{- define "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.fullname" -}}
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


{{- define "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.labels" -}}
helm.sh/chart: {{ include "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.chart" . }}
{{ include "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20c4f66f-edea-4210-9093-db6bfae7fccc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}