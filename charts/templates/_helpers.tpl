
{{- define "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.fullname" -}}
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


{{- define "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.labels" -}}
helm.sh/chart: {{ include "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.chart" . }}
{{ include "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof03fd1bf-fc3c-4404-bf01-469242ea0a48.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}