
{{- define "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.fullname" -}}
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


{{- define "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.labels" -}}
helm.sh/chart: {{ include "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.chart" . }}
{{ include "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57af0cba-fa09-44e3-84db-3a48e9e6abad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}