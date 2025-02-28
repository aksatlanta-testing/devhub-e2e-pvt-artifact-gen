
{{- define "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.fullname" -}}
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


{{- define "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.labels" -}}
helm.sh/chart: {{ include "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.chart" . }}
{{ include "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod963a20e-b7a1-49aa-94ec-4ece46faf087.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}