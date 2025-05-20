
{{- define "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.fullname" -}}
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


{{- define "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.labels" -}}
helm.sh/chart: {{ include "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.chart" . }}
{{ include "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob04b1dd8-3858-4c6c-8510-790ec8aa343f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}