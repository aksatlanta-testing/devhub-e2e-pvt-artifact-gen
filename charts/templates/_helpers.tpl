
{{- define "go-echod9193118-8f03-4793-8998-e1ee60637675.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9193118-8f03-4793-8998-e1ee60637675.fullname" -}}
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


{{- define "go-echod9193118-8f03-4793-8998-e1ee60637675.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9193118-8f03-4793-8998-e1ee60637675.labels" -}}
helm.sh/chart: {{ include "go-echod9193118-8f03-4793-8998-e1ee60637675.chart" . }}
{{ include "go-echod9193118-8f03-4793-8998-e1ee60637675.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9193118-8f03-4793-8998-e1ee60637675.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9193118-8f03-4793-8998-e1ee60637675.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}