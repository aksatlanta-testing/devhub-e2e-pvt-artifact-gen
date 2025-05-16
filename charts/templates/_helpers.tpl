
{{- define "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.fullname" -}}
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


{{- define "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.labels" -}}
helm.sh/chart: {{ include "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.chart" . }}
{{ include "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4faca4d4-aaba-48e5-bf83-2580f2e3d255.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}