
{{- define "go-echoe78a2041-2439-4946-82c7-1377d4357fce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe78a2041-2439-4946-82c7-1377d4357fce.fullname" -}}
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


{{- define "go-echoe78a2041-2439-4946-82c7-1377d4357fce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe78a2041-2439-4946-82c7-1377d4357fce.labels" -}}
helm.sh/chart: {{ include "go-echoe78a2041-2439-4946-82c7-1377d4357fce.chart" . }}
{{ include "go-echoe78a2041-2439-4946-82c7-1377d4357fce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe78a2041-2439-4946-82c7-1377d4357fce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe78a2041-2439-4946-82c7-1377d4357fce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}