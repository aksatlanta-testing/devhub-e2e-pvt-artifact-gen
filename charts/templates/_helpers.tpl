
{{- define "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.fullname" -}}
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


{{- define "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.labels" -}}
helm.sh/chart: {{ include "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.chart" . }}
{{ include "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf6190e3-2c3b-420f-8310-630e6f1747cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}