
{{- define "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.fullname" -}}
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


{{- define "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.labels" -}}
helm.sh/chart: {{ include "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.chart" . }}
{{ include "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc7f94d9-9837-4149-ad36-6cf80ce77005.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}