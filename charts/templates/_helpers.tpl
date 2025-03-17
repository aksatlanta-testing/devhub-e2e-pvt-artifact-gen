
{{- define "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.fullname" -}}
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


{{- define "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.labels" -}}
helm.sh/chart: {{ include "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.chart" . }}
{{ include "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodd211a63-28aa-46bc-b7bc-3ce25acffa85.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}