
{{- define "go-echo9630321b-648a-448a-b476-255d38b35d3e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9630321b-648a-448a-b476-255d38b35d3e.fullname" -}}
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


{{- define "go-echo9630321b-648a-448a-b476-255d38b35d3e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9630321b-648a-448a-b476-255d38b35d3e.labels" -}}
helm.sh/chart: {{ include "go-echo9630321b-648a-448a-b476-255d38b35d3e.chart" . }}
{{ include "go-echo9630321b-648a-448a-b476-255d38b35d3e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9630321b-648a-448a-b476-255d38b35d3e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9630321b-648a-448a-b476-255d38b35d3e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}