
{{- define "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.fullname" -}}
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


{{- define "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.labels" -}}
helm.sh/chart: {{ include "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.chart" . }}
{{ include "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86fc13de-efbc-4158-83ad-a3fcbd5e36aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}