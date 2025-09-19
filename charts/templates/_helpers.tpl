
{{- define "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.fullname" -}}
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


{{- define "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.labels" -}}
helm.sh/chart: {{ include "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.chart" . }}
{{ include "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo263c3403-62e4-4e34-830f-d40e2c44bfaa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}