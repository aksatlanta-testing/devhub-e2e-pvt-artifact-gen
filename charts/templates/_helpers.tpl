
{{- define "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.fullname" -}}
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


{{- define "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.labels" -}}
helm.sh/chart: {{ include "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.chart" . }}
{{ include "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe104a9a8-bdd2-4b48-82a0-05e2de4bc4ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}