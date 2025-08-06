
{{- define "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.fullname" -}}
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


{{- define "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.labels" -}}
helm.sh/chart: {{ include "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.chart" . }}
{{ include "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57c8be34-135f-4ee7-86cf-c87dc14792ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}