
{{- define "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.fullname" -}}
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


{{- define "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.labels" -}}
helm.sh/chart: {{ include "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.chart" . }}
{{ include "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo693937c9-66a8-4587-b626-b8429eb5f7ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}