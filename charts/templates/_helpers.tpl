
{{- define "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.fullname" -}}
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


{{- define "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.labels" -}}
helm.sh/chart: {{ include "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.chart" . }}
{{ include "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1bed0a9-2b8c-400b-a5e0-7fbfea10018c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}