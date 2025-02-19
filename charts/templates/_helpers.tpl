
{{- define "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.fullname" -}}
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


{{- define "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.labels" -}}
helm.sh/chart: {{ include "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.chart" . }}
{{ include "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea10ab9e-1843-4e0c-82c6-1e33b6e62cdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}