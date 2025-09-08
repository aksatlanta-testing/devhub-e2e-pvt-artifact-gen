
{{- define "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.fullname" -}}
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


{{- define "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.labels" -}}
helm.sh/chart: {{ include "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.chart" . }}
{{ include "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa95980ab-41fd-4a51-8f57-289a4aa9ecdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}