
{{- define "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.fullname" -}}
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


{{- define "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.labels" -}}
helm.sh/chart: {{ include "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.chart" . }}
{{ include "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7e90d521-2487-44c9-80b1-fc689f28381d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}