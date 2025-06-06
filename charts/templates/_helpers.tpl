
{{- define "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.fullname" -}}
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


{{- define "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.labels" -}}
helm.sh/chart: {{ include "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.chart" . }}
{{ include "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6cbc135a-9c08-41b5-a221-c955c6d94c8d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}