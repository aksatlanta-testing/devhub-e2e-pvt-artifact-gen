
{{- define "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.fullname" -}}
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


{{- define "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.labels" -}}
helm.sh/chart: {{ include "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.chart" . }}
{{ include "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7f1d0d07-79b2-4993-8daf-581ea0e5abdd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}