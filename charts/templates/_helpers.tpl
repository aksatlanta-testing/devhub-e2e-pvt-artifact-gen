
{{- define "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.fullname" -}}
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


{{- define "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.labels" -}}
helm.sh/chart: {{ include "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.chart" . }}
{{ include "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo978bb740-05f3-45c8-a6ff-dc88571b4694.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}