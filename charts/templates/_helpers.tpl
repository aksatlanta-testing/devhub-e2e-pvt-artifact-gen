
{{- define "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.fullname" -}}
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


{{- define "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.labels" -}}
helm.sh/chart: {{ include "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.chart" . }}
{{ include "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa835bbf4-446e-4106-b36a-a07d4273199f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}