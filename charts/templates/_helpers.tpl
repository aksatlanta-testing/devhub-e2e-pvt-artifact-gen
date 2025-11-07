
{{- define "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.fullname" -}}
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


{{- define "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.labels" -}}
helm.sh/chart: {{ include "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.chart" . }}
{{ include "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo15304071-5a76-4f1a-a880-8fcdfa89645a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}