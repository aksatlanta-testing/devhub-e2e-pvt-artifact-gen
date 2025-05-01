
{{- define "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.fullname" -}}
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


{{- define "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.labels" -}}
helm.sh/chart: {{ include "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.chart" . }}
{{ include "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce27487f-3cfc-486d-a71c-cd04ee6ffc87.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}