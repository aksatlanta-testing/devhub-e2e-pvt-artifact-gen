
{{- define "go-echo40376054-0606-4ab1-9217-f2921a8e257e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40376054-0606-4ab1-9217-f2921a8e257e.fullname" -}}
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


{{- define "go-echo40376054-0606-4ab1-9217-f2921a8e257e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo40376054-0606-4ab1-9217-f2921a8e257e.labels" -}}
helm.sh/chart: {{ include "go-echo40376054-0606-4ab1-9217-f2921a8e257e.chart" . }}
{{ include "go-echo40376054-0606-4ab1-9217-f2921a8e257e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo40376054-0606-4ab1-9217-f2921a8e257e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo40376054-0606-4ab1-9217-f2921a8e257e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}