
{{- define "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.fullname" -}}
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


{{- define "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.labels" -}}
helm.sh/chart: {{ include "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.chart" . }}
{{ include "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobac73018-1583-4c5b-a4e9-2e46cbb4b00f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}