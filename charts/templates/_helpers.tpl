
{{- define "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.fullname" -}}
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


{{- define "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.labels" -}}
helm.sh/chart: {{ include "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.chart" . }}
{{ include "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod986fdc2-0297-42cb-9d75-62b7fef8614d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}