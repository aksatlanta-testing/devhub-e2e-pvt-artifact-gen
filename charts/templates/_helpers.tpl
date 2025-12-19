
{{- define "go-echobeabae6c-6528-4068-a24b-b0f802035828.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobeabae6c-6528-4068-a24b-b0f802035828.fullname" -}}
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


{{- define "go-echobeabae6c-6528-4068-a24b-b0f802035828.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobeabae6c-6528-4068-a24b-b0f802035828.labels" -}}
helm.sh/chart: {{ include "go-echobeabae6c-6528-4068-a24b-b0f802035828.chart" . }}
{{ include "go-echobeabae6c-6528-4068-a24b-b0f802035828.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobeabae6c-6528-4068-a24b-b0f802035828.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobeabae6c-6528-4068-a24b-b0f802035828.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}