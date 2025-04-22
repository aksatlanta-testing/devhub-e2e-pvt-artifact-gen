
{{- define "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.fullname" -}}
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


{{- define "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.labels" -}}
helm.sh/chart: {{ include "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.chart" . }}
{{ include "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfdd144d-73f1-4dd4-80ae-484df308b774.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}