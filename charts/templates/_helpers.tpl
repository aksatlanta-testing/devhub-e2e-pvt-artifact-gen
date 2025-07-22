
{{- define "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.fullname" -}}
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


{{- define "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.labels" -}}
helm.sh/chart: {{ include "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.chart" . }}
{{ include "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo769ff41a-571d-4022-97b5-8b0e87f5e63f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}