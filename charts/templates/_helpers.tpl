
{{- define "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.fullname" -}}
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


{{- define "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.labels" -}}
helm.sh/chart: {{ include "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.chart" . }}
{{ include "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9585b241-27b1-48e1-b309-92b4329c2acc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}