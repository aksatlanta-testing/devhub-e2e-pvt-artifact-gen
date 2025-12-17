
{{- define "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.fullname" -}}
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


{{- define "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.labels" -}}
helm.sh/chart: {{ include "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.chart" . }}
{{ include "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe82e713b-fdb9-4414-9850-0a57c8e57cef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}