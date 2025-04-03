
{{- define "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.fullname" -}}
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


{{- define "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.labels" -}}
helm.sh/chart: {{ include "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.chart" . }}
{{ include "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebff0ee6-dbb8-4fea-8c71-74dda2285940.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}