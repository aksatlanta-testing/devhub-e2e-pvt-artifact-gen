
{{- define "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.fullname" -}}
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


{{- define "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.labels" -}}
helm.sh/chart: {{ include "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.chart" . }}
{{ include "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6280adbe-45e3-4a6c-a35e-be94d9b44d96.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}