
{{- define "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.fullname" -}}
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


{{- define "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.labels" -}}
helm.sh/chart: {{ include "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.chart" . }}
{{ include "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo478223f6-0a27-4c33-bc43-f9f46fe36079.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}