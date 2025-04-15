
{{- define "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.fullname" -}}
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


{{- define "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.labels" -}}
helm.sh/chart: {{ include "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.chart" . }}
{{ include "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf8eda33-f0e3-4037-bb87-166e32bc388c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}