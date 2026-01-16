
{{- define "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.fullname" -}}
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


{{- define "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.labels" -}}
helm.sh/chart: {{ include "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.chart" . }}
{{ include "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo415edf57-cd6c-4366-87ce-cb947343e0ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}