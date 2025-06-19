
{{- define "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.fullname" -}}
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


{{- define "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.labels" -}}
helm.sh/chart: {{ include "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.chart" . }}
{{ include "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7e2b0eb0-b65a-4747-9bb3-d073388a687c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}