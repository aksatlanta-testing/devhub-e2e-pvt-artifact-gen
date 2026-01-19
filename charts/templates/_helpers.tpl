
{{- define "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.fullname" -}}
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


{{- define "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.labels" -}}
helm.sh/chart: {{ include "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.chart" . }}
{{ include "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4c5de97f-d5fc-4fa7-bb12-0f9c974443ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}