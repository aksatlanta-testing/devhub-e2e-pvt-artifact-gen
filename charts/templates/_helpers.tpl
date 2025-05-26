
{{- define "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.fullname" -}}
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


{{- define "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.labels" -}}
helm.sh/chart: {{ include "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.chart" . }}
{{ include "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeb0a2b57-d028-41bf-90cb-5fd10a1c6070.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}