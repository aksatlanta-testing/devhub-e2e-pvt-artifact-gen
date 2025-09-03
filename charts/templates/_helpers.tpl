
{{- define "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.fullname" -}}
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


{{- define "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.labels" -}}
helm.sh/chart: {{ include "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.chart" . }}
{{ include "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ca8f1c1-e666-46ed-a121-0d5815150cdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}