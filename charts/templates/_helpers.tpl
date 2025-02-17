
{{- define "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.fullname" -}}
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


{{- define "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.labels" -}}
helm.sh/chart: {{ include "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.chart" . }}
{{ include "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof339ea27-09db-461d-a3e4-c7f5e8e62c6f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}