
{{- define "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.fullname" -}}
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


{{- define "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.labels" -}}
helm.sh/chart: {{ include "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.chart" . }}
{{ include "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce653c7f-5ba5-4046-9329-7d4e1ea6743f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}