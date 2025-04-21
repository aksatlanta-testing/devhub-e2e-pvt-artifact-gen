
{{- define "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.fullname" -}}
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


{{- define "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.labels" -}}
helm.sh/chart: {{ include "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.chart" . }}
{{ include "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8e0db55-e4e8-407a-9e0d-6cb7466df5dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}