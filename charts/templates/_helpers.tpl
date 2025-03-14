
{{- define "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.fullname" -}}
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


{{- define "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.labels" -}}
helm.sh/chart: {{ include "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.chart" . }}
{{ include "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae2a2d7f-e77e-4eba-8207-3d8293a4b409.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}