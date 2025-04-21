
{{- define "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.fullname" -}}
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


{{- define "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.labels" -}}
helm.sh/chart: {{ include "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.chart" . }}
{{ include "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffa7a298-6d97-4d49-85c2-038d40f92af0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}