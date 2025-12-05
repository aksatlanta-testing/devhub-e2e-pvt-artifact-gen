
{{- define "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.fullname" -}}
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


{{- define "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.labels" -}}
helm.sh/chart: {{ include "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.chart" . }}
{{ include "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1201f865-46ee-44bb-b3f1-52ed7a56002f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}