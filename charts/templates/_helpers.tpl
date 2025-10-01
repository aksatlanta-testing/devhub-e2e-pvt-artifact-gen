
{{- define "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.fullname" -}}
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


{{- define "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.labels" -}}
helm.sh/chart: {{ include "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.chart" . }}
{{ include "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc55e5665-3cce-43ed-9862-ba7ee444c6fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}