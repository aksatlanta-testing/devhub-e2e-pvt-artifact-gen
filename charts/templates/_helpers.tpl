
{{- define "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.fullname" -}}
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


{{- define "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.labels" -}}
helm.sh/chart: {{ include "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.chart" . }}
{{ include "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd84368c-7952-48b4-bccc-21d3f38b721c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}