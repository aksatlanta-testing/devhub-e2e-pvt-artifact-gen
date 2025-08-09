
{{- define "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.fullname" -}}
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


{{- define "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.labels" -}}
helm.sh/chart: {{ include "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.chart" . }}
{{ include "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb19bee4-a8db-412d-962c-4bdcc94848ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}