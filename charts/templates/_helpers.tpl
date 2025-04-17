
{{- define "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.fullname" -}}
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


{{- define "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.labels" -}}
helm.sh/chart: {{ include "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.chart" . }}
{{ include "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5b86140-6431-4ac6-8694-1ba2778c25dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}