
{{- define "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.fullname" -}}
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


{{- define "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.labels" -}}
helm.sh/chart: {{ include "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.chart" . }}
{{ include "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8230e8e-ad49-4100-9e4b-32dcaec09bdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}