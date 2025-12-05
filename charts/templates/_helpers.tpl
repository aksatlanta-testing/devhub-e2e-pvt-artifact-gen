
{{- define "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.fullname" -}}
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


{{- define "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.labels" -}}
helm.sh/chart: {{ include "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.chart" . }}
{{ include "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe11b41e-e131-4791-aa7c-24ea00d049cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}