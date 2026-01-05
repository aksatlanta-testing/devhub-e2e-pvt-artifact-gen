
{{- define "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.fullname" -}}
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


{{- define "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.labels" -}}
helm.sh/chart: {{ include "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.chart" . }}
{{ include "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabf5df05-719f-4e0d-841d-9d19c0f21099.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}