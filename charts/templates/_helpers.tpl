
{{- define "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.fullname" -}}
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


{{- define "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.labels" -}}
helm.sh/chart: {{ include "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.chart" . }}
{{ include "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa69d226-cf93-4239-8b34-a432c95c9c4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}