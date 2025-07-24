
{{- define "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.fullname" -}}
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


{{- define "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.labels" -}}
helm.sh/chart: {{ include "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.chart" . }}
{{ include "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfa7ef1d-8e83-476d-8d19-c435806bce02.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}