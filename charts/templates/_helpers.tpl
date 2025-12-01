
{{- define "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.fullname" -}}
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


{{- define "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.labels" -}}
helm.sh/chart: {{ include "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.chart" . }}
{{ include "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77de83a7-5082-4e42-aa56-6b47b1cae7cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}