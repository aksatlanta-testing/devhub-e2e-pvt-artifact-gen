
{{- define "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.fullname" -}}
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


{{- define "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.labels" -}}
helm.sh/chart: {{ include "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.chart" . }}
{{ include "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobec7f6d3-048f-4558-aa12-8f20c0accb37.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}