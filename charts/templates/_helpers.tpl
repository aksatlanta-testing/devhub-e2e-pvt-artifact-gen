
{{- define "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.fullname" -}}
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


{{- define "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.labels" -}}
helm.sh/chart: {{ include "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.chart" . }}
{{ include "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod243d2ca-f2b5-4520-b17d-c44792e04ccc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}