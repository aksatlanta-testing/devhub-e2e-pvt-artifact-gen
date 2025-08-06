
{{- define "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.fullname" -}}
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


{{- define "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.labels" -}}
helm.sh/chart: {{ include "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.chart" . }}
{{ include "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ff78551-cb9f-47b5-b9c9-fb7b296568be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}