
{{- define "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.fullname" -}}
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


{{- define "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.labels" -}}
helm.sh/chart: {{ include "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.chart" . }}
{{ include "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo09b5dbd2-951b-4478-b971-5c33a3da9f2e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}