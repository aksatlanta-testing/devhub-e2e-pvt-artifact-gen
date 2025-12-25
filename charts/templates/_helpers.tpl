
{{- define "go-echo69a619e2-8925-40db-9602-2c06e5972aea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69a619e2-8925-40db-9602-2c06e5972aea.fullname" -}}
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


{{- define "go-echo69a619e2-8925-40db-9602-2c06e5972aea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69a619e2-8925-40db-9602-2c06e5972aea.labels" -}}
helm.sh/chart: {{ include "go-echo69a619e2-8925-40db-9602-2c06e5972aea.chart" . }}
{{ include "go-echo69a619e2-8925-40db-9602-2c06e5972aea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69a619e2-8925-40db-9602-2c06e5972aea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69a619e2-8925-40db-9602-2c06e5972aea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}