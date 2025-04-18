
{{- define "go-echo64838aad-9148-474f-898d-0b724d52449b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64838aad-9148-474f-898d-0b724d52449b.fullname" -}}
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


{{- define "go-echo64838aad-9148-474f-898d-0b724d52449b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64838aad-9148-474f-898d-0b724d52449b.labels" -}}
helm.sh/chart: {{ include "go-echo64838aad-9148-474f-898d-0b724d52449b.chart" . }}
{{ include "go-echo64838aad-9148-474f-898d-0b724d52449b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo64838aad-9148-474f-898d-0b724d52449b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo64838aad-9148-474f-898d-0b724d52449b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}