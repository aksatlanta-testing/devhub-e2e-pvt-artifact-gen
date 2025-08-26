
{{- define "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.fullname" -}}
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


{{- define "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.labels" -}}
helm.sh/chart: {{ include "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.chart" . }}
{{ include "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa402437b-e7a7-4e63-bc6d-50492fcaddba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}