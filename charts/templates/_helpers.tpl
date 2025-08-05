
{{- define "go-echof97bf2af-c878-4527-8220-b7e462f78388.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof97bf2af-c878-4527-8220-b7e462f78388.fullname" -}}
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


{{- define "go-echof97bf2af-c878-4527-8220-b7e462f78388.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof97bf2af-c878-4527-8220-b7e462f78388.labels" -}}
helm.sh/chart: {{ include "go-echof97bf2af-c878-4527-8220-b7e462f78388.chart" . }}
{{ include "go-echof97bf2af-c878-4527-8220-b7e462f78388.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof97bf2af-c878-4527-8220-b7e462f78388.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof97bf2af-c878-4527-8220-b7e462f78388.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}