
{{- define "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.fullname" -}}
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


{{- define "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.labels" -}}
helm.sh/chart: {{ include "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.chart" . }}
{{ include "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4378b805-7a36-43d8-a2dd-1967a244434c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}