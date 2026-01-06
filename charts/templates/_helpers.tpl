
{{- define "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.fullname" -}}
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


{{- define "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.labels" -}}
helm.sh/chart: {{ include "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.chart" . }}
{{ include "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0b894b5-7525-4f7d-8e7f-f532f5fc9a1b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}