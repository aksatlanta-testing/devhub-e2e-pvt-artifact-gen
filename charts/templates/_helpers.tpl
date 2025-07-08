
{{- define "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.fullname" -}}
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


{{- define "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.labels" -}}
helm.sh/chart: {{ include "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.chart" . }}
{{ include "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d043f4f-3d30-4be6-b8da-0dfa44d6316c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}