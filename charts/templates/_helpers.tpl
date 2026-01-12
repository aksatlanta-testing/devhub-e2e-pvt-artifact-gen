
{{- define "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.fullname" -}}
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


{{- define "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.labels" -}}
helm.sh/chart: {{ include "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.chart" . }}
{{ include "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2dd21d83-1213-4ee5-852b-cb8ca0c9fc28.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}