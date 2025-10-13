
{{- define "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.fullname" -}}
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


{{- define "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.labels" -}}
helm.sh/chart: {{ include "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.chart" . }}
{{ include "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedd4ce70-f2b9-41b7-b949-3d0a5b45e03b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}