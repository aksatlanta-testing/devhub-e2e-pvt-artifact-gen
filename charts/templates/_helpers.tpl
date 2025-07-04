
{{- define "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.fullname" -}}
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


{{- define "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.labels" -}}
helm.sh/chart: {{ include "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.chart" . }}
{{ include "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo959bcd21-d5f5-49c1-a556-f313fd0cf01a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}