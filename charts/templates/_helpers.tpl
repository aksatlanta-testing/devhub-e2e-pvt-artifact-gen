
{{- define "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.fullname" -}}
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


{{- define "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.labels" -}}
helm.sh/chart: {{ include "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.chart" . }}
{{ include "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdd66143-8ac7-4638-ad3f-d20aaa7ba1ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}