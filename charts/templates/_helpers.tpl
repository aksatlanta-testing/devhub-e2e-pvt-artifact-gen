
{{- define "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.fullname" -}}
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


{{- define "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.labels" -}}
helm.sh/chart: {{ include "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.chart" . }}
{{ include "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc17d78aa-b019-42b0-95c3-6d461a742fbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}