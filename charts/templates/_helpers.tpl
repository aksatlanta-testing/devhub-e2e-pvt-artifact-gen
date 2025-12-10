
{{- define "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.fullname" -}}
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


{{- define "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.labels" -}}
helm.sh/chart: {{ include "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.chart" . }}
{{ include "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo287eb85d-9690-4c4f-8ff8-902e5495209e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}