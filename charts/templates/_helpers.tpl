
{{- define "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.fullname" -}}
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


{{- define "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.labels" -}}
helm.sh/chart: {{ include "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.chart" . }}
{{ include "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo281e89f4-1387-41a2-9500-cbfcb292ebbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}