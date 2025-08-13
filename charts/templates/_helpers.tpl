
{{- define "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.fullname" -}}
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


{{- define "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.labels" -}}
helm.sh/chart: {{ include "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.chart" . }}
{{ include "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo66232a98-37e2-43ce-9daa-a833876bbcdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}