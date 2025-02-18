
{{- define "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.fullname" -}}
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


{{- define "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.labels" -}}
helm.sh/chart: {{ include "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.chart" . }}
{{ include "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo44cf8d6d-40d8-4946-b336-44f4a7c33eee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}