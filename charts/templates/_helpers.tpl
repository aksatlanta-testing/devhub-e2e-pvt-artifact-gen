
{{- define "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.fullname" -}}
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


{{- define "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.labels" -}}
helm.sh/chart: {{ include "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.chart" . }}
{{ include "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo56f4cbd4-f887-41eb-992a-9ce6f67843cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}