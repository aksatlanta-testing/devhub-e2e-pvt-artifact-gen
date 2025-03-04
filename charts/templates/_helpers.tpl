
{{- define "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.fullname" -}}
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


{{- define "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.labels" -}}
helm.sh/chart: {{ include "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.chart" . }}
{{ include "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa2017e4-bd72-4a0d-80c2-83a489056528.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}