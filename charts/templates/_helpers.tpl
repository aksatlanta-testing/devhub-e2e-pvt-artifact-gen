
{{- define "go-echo368236ab-faa1-46a3-820d-52a1af972482.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo368236ab-faa1-46a3-820d-52a1af972482.fullname" -}}
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


{{- define "go-echo368236ab-faa1-46a3-820d-52a1af972482.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo368236ab-faa1-46a3-820d-52a1af972482.labels" -}}
helm.sh/chart: {{ include "go-echo368236ab-faa1-46a3-820d-52a1af972482.chart" . }}
{{ include "go-echo368236ab-faa1-46a3-820d-52a1af972482.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo368236ab-faa1-46a3-820d-52a1af972482.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo368236ab-faa1-46a3-820d-52a1af972482.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}