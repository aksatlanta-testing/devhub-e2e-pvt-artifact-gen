
{{- define "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.fullname" -}}
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


{{- define "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.labels" -}}
helm.sh/chart: {{ include "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.chart" . }}
{{ include "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc988b316-2ff1-4363-827a-0b76c776be5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}