
{{- define "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.fullname" -}}
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


{{- define "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.labels" -}}
helm.sh/chart: {{ include "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.chart" . }}
{{ include "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaaa43053-12d9-4b17-bac4-71c2918bf45e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}