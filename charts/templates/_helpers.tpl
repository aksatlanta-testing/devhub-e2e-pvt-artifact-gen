
{{- define "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.fullname" -}}
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


{{- define "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.labels" -}}
helm.sh/chart: {{ include "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.chart" . }}
{{ include "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedaa0caa-23f2-4288-90c9-5e68c30ea330.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}