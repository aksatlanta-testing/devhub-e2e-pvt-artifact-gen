
{{- define "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.fullname" -}}
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


{{- define "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.labels" -}}
helm.sh/chart: {{ include "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.chart" . }}
{{ include "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeab332d1-f0ec-4b74-a004-d05f801a862f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}