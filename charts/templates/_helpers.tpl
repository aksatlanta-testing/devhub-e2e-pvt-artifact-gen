
{{- define "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.fullname" -}}
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


{{- define "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.labels" -}}
helm.sh/chart: {{ include "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.chart" . }}
{{ include "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7431286-4f2c-4e96-9f04-e8670b8cda79.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}