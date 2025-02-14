
{{- define "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.fullname" -}}
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


{{- define "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.labels" -}}
helm.sh/chart: {{ include "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.chart" . }}
{{ include "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodad6ad5a-0d97-431b-87d2-b7d7c5de9fcb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}