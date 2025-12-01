
{{- define "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.fullname" -}}
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


{{- define "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.labels" -}}
helm.sh/chart: {{ include "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.chart" . }}
{{ include "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4d24de7-eaf6-4d72-b72d-3ad7500ee66a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}