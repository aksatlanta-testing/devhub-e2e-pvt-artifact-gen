
{{- define "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.fullname" -}}
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


{{- define "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.labels" -}}
helm.sh/chart: {{ include "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.chart" . }}
{{ include "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo22231c12-c6e4-4356-b3d0-a778a814abe6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}