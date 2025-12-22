
{{- define "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.fullname" -}}
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


{{- define "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.labels" -}}
helm.sh/chart: {{ include "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.chart" . }}
{{ include "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8c59a5ac-e60b-4e92-bf64-c77b40439f22.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}