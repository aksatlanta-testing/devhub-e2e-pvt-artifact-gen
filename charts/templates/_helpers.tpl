
{{- define "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.fullname" -}}
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


{{- define "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.labels" -}}
helm.sh/chart: {{ include "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.chart" . }}
{{ include "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7265a6f2-bdae-410e-8f77-01cd3e7e4780.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}