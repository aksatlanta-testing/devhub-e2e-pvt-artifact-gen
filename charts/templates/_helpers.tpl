
{{- define "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.fullname" -}}
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


{{- define "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.labels" -}}
helm.sh/chart: {{ include "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.chart" . }}
{{ include "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05c69fb9-2e1d-49f5-8937-e4d622130dfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}