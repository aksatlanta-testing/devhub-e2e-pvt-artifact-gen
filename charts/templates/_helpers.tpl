
{{- define "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.fullname" -}}
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


{{- define "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.labels" -}}
helm.sh/chart: {{ include "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.chart" . }}
{{ include "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2557bbc-2cad-40e9-bbbf-c836c958a21a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}