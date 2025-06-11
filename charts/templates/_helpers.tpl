
{{- define "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.fullname" -}}
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


{{- define "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.labels" -}}
helm.sh/chart: {{ include "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.chart" . }}
{{ include "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9f1775fe-17f2-4c13-8439-bc3161ae80bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}