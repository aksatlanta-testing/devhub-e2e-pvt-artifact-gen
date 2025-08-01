
{{- define "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.fullname" -}}
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


{{- define "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.labels" -}}
helm.sh/chart: {{ include "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.chart" . }}
{{ include "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6b4c7649-6946-4707-866f-eaafdc32fceb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}