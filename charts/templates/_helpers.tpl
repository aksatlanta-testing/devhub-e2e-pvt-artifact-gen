
{{- define "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.fullname" -}}
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


{{- define "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.labels" -}}
helm.sh/chart: {{ include "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.chart" . }}
{{ include "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo209f5de3-d131-4901-81ae-a8da54e5364a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}