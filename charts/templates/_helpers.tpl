
{{- define "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.fullname" -}}
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


{{- define "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.labels" -}}
helm.sh/chart: {{ include "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.chart" . }}
{{ include "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4ebed8ed-4ac8-487d-a315-d1271bc1661c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}