
{{- define "go-echo15395154-6632-4768-97df-147380c69b4f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15395154-6632-4768-97df-147380c69b4f.fullname" -}}
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


{{- define "go-echo15395154-6632-4768-97df-147380c69b4f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15395154-6632-4768-97df-147380c69b4f.labels" -}}
helm.sh/chart: {{ include "go-echo15395154-6632-4768-97df-147380c69b4f.chart" . }}
{{ include "go-echo15395154-6632-4768-97df-147380c69b4f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15395154-6632-4768-97df-147380c69b4f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15395154-6632-4768-97df-147380c69b4f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}