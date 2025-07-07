
{{- define "go-echod032d452-853a-446f-b99c-5e68dd17ae92.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod032d452-853a-446f-b99c-5e68dd17ae92.fullname" -}}
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


{{- define "go-echod032d452-853a-446f-b99c-5e68dd17ae92.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod032d452-853a-446f-b99c-5e68dd17ae92.labels" -}}
helm.sh/chart: {{ include "go-echod032d452-853a-446f-b99c-5e68dd17ae92.chart" . }}
{{ include "go-echod032d452-853a-446f-b99c-5e68dd17ae92.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod032d452-853a-446f-b99c-5e68dd17ae92.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod032d452-853a-446f-b99c-5e68dd17ae92.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}