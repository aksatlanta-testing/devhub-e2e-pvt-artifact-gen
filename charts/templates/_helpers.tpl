
{{- define "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.fullname" -}}
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


{{- define "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.labels" -}}
helm.sh/chart: {{ include "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.chart" . }}
{{ include "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo28156b59-3bbf-4f96-97be-6cb0fc22766b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}