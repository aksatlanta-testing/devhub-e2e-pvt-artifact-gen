
{{- define "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.fullname" -}}
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


{{- define "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.labels" -}}
helm.sh/chart: {{ include "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.chart" . }}
{{ include "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff203208-6f0a-48f4-9312-39a05ea635ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}