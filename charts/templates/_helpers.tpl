
{{- define "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.fullname" -}}
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


{{- define "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.labels" -}}
helm.sh/chart: {{ include "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.chart" . }}
{{ include "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4e272dd2-c007-4800-a1bb-9358d0687fab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}