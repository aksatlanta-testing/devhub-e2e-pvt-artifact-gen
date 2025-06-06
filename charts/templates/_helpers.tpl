
{{- define "go-echob12a7408-e944-43ff-b80d-5697b98465ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob12a7408-e944-43ff-b80d-5697b98465ff.fullname" -}}
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


{{- define "go-echob12a7408-e944-43ff-b80d-5697b98465ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob12a7408-e944-43ff-b80d-5697b98465ff.labels" -}}
helm.sh/chart: {{ include "go-echob12a7408-e944-43ff-b80d-5697b98465ff.chart" . }}
{{ include "go-echob12a7408-e944-43ff-b80d-5697b98465ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob12a7408-e944-43ff-b80d-5697b98465ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob12a7408-e944-43ff-b80d-5697b98465ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}