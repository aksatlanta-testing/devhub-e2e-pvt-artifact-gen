
{{- define "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.fullname" -}}
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


{{- define "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.labels" -}}
helm.sh/chart: {{ include "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.chart" . }}
{{ include "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob60bd497-15fe-4d80-a430-6aa9a10f3dca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}