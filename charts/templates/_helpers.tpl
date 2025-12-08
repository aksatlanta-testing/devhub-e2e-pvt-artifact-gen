
{{- define "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.fullname" -}}
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


{{- define "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.labels" -}}
helm.sh/chart: {{ include "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.chart" . }}
{{ include "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47f4b185-fffb-4e11-9838-dffcecb12705.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}