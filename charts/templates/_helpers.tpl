
{{- define "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.fullname" -}}
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


{{- define "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.labels" -}}
helm.sh/chart: {{ include "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.chart" . }}
{{ include "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4a3721c3-2366-462a-b488-b50193d45a5a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}