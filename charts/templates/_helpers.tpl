
{{- define "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.fullname" -}}
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


{{- define "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.labels" -}}
helm.sh/chart: {{ include "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.chart" . }}
{{ include "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo827f8207-1a5c-447b-8a19-3f2464ae11dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}