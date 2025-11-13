
{{- define "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.fullname" -}}
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


{{- define "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.labels" -}}
helm.sh/chart: {{ include "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.chart" . }}
{{ include "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofabdeec7-5484-48a9-a272-5e1c9550cfe8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}