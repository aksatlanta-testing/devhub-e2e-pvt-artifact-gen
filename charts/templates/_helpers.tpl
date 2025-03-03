
{{- define "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.fullname" -}}
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


{{- define "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.labels" -}}
helm.sh/chart: {{ include "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.chart" . }}
{{ include "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof86af585-0fb5-4842-88fc-380d2dbdbc89.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}