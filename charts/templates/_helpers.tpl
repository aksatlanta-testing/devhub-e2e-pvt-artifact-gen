
{{- define "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.fullname" -}}
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


{{- define "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.labels" -}}
helm.sh/chart: {{ include "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.chart" . }}
{{ include "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa8ef7e03-0b18-4e18-a44a-26ccdcec193a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}