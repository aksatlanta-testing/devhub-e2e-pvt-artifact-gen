
{{- define "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.fullname" -}}
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


{{- define "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.labels" -}}
helm.sh/chart: {{ include "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.chart" . }}
{{ include "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61c67818-0ba7-47bc-844d-4ee245d8d9df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}