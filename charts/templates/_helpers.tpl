
{{- define "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.fullname" -}}
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


{{- define "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.labels" -}}
helm.sh/chart: {{ include "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.chart" . }}
{{ include "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9907db63-43ca-4e45-844b-8cd7e2b94dee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}