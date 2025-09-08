
{{- define "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.fullname" -}}
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


{{- define "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.labels" -}}
helm.sh/chart: {{ include "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.chart" . }}
{{ include "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a0941ba-bfcf-46e3-837d-2071d5f3915a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}