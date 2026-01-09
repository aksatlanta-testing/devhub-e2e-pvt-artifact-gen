
{{- define "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.fullname" -}}
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


{{- define "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.labels" -}}
helm.sh/chart: {{ include "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.chart" . }}
{{ include "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofea3fb41-0235-437d-ac06-0666f3ebcdea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}