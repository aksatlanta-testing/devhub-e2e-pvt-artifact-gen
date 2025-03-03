
{{- define "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.fullname" -}}
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


{{- define "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.labels" -}}
helm.sh/chart: {{ include "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.chart" . }}
{{ include "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocca09d11-bf2e-48f2-af4f-44708c87f90c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}