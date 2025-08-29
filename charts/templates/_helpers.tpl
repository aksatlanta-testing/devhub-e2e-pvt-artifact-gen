
{{- define "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.fullname" -}}
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


{{- define "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.labels" -}}
helm.sh/chart: {{ include "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.chart" . }}
{{ include "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8cc3640b-5968-4018-81b5-272b1e139d7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}