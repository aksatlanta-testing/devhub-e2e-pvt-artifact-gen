
{{- define "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.fullname" -}}
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


{{- define "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.labels" -}}
helm.sh/chart: {{ include "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.chart" . }}
{{ include "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob227968a-72d7-4ca1-ade1-75a6a7e783cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}