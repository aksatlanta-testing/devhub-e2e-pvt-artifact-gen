
{{- define "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.fullname" -}}
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


{{- define "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.labels" -}}
helm.sh/chart: {{ include "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.chart" . }}
{{ include "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe916cb17-ad7f-42d7-b37f-3b3af988ce42.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}