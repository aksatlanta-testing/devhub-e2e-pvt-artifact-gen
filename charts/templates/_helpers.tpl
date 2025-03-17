
{{- define "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.fullname" -}}
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


{{- define "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.labels" -}}
helm.sh/chart: {{ include "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.chart" . }}
{{ include "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4574e5b-3095-44ba-a237-f0b67d15160b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}