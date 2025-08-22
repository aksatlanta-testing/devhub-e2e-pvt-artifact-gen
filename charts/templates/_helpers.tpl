
{{- define "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.fullname" -}}
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


{{- define "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.labels" -}}
helm.sh/chart: {{ include "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.chart" . }}
{{ include "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff4f62d1-75c1-400a-b972-a5bd28f9e819.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}