
{{- define "go-echoac4083be-0676-490e-beec-9da0e0c94613.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4083be-0676-490e-beec-9da0e0c94613.fullname" -}}
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


{{- define "go-echoac4083be-0676-490e-beec-9da0e0c94613.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac4083be-0676-490e-beec-9da0e0c94613.labels" -}}
helm.sh/chart: {{ include "go-echoac4083be-0676-490e-beec-9da0e0c94613.chart" . }}
{{ include "go-echoac4083be-0676-490e-beec-9da0e0c94613.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac4083be-0676-490e-beec-9da0e0c94613.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac4083be-0676-490e-beec-9da0e0c94613.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}