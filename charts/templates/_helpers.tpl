
{{- define "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.fullname" -}}
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


{{- define "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.labels" -}}
helm.sh/chart: {{ include "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.chart" . }}
{{ include "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4983fbf-5c8c-4699-bca2-87313b3c982d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}