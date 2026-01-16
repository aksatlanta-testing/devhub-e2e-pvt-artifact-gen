
{{- define "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.fullname" -}}
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


{{- define "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.labels" -}}
helm.sh/chart: {{ include "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.chart" . }}
{{ include "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76f5988c-4bca-42bd-8923-fa33ea4fe8fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}