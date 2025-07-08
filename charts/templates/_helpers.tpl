
{{- define "go-echo0233b005-8920-4b79-930c-01ee968724be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0233b005-8920-4b79-930c-01ee968724be.fullname" -}}
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


{{- define "go-echo0233b005-8920-4b79-930c-01ee968724be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0233b005-8920-4b79-930c-01ee968724be.labels" -}}
helm.sh/chart: {{ include "go-echo0233b005-8920-4b79-930c-01ee968724be.chart" . }}
{{ include "go-echo0233b005-8920-4b79-930c-01ee968724be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0233b005-8920-4b79-930c-01ee968724be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0233b005-8920-4b79-930c-01ee968724be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}