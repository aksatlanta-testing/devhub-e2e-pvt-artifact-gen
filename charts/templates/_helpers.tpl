
{{- define "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.fullname" -}}
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


{{- define "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.labels" -}}
helm.sh/chart: {{ include "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.chart" . }}
{{ include "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05a7a60b-8291-4961-b454-6afcc5d887bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}