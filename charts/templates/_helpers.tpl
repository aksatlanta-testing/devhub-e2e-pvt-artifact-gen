
{{- define "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.fullname" -}}
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


{{- define "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.labels" -}}
helm.sh/chart: {{ include "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.chart" . }}
{{ include "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49712a3c-062c-4e2b-91d6-cf40edc3c084.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}