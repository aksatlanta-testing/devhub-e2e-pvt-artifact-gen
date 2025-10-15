
{{- define "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.fullname" -}}
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


{{- define "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.labels" -}}
helm.sh/chart: {{ include "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.chart" . }}
{{ include "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05cb9c61-8c0e-4273-8d4e-a129b2e1553e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}