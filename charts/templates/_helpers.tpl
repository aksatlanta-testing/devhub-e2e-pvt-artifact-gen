
{{- define "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.fullname" -}}
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


{{- define "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.labels" -}}
helm.sh/chart: {{ include "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.chart" . }}
{{ include "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48767359-f64e-4a6d-a8ea-b0ce32fd6382.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}