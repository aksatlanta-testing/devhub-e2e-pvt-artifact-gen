
{{- define "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.fullname" -}}
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


{{- define "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.labels" -}}
helm.sh/chart: {{ include "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.chart" . }}
{{ include "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5c2b6d56-5768-4c13-a8a4-600414093691.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}