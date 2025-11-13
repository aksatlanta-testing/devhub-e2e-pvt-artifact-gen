
{{- define "go-echo5338e5db-4aab-4961-af96-9166831dadcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5338e5db-4aab-4961-af96-9166831dadcf.fullname" -}}
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


{{- define "go-echo5338e5db-4aab-4961-af96-9166831dadcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5338e5db-4aab-4961-af96-9166831dadcf.labels" -}}
helm.sh/chart: {{ include "go-echo5338e5db-4aab-4961-af96-9166831dadcf.chart" . }}
{{ include "go-echo5338e5db-4aab-4961-af96-9166831dadcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5338e5db-4aab-4961-af96-9166831dadcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5338e5db-4aab-4961-af96-9166831dadcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}