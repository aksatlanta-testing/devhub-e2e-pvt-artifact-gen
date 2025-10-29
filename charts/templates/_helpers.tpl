
{{- define "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.fullname" -}}
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


{{- define "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.labels" -}}
helm.sh/chart: {{ include "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.chart" . }}
{{ include "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0c57b4f3-bbe7-454e-b602-2bfc000435cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}