
{{- define "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.fullname" -}}
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


{{- define "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.labels" -}}
helm.sh/chart: {{ include "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.chart" . }}
{{ include "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod343f884-e0c7-40ec-a03a-f09eab445d7f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}