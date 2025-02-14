
{{- define "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.fullname" -}}
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


{{- define "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.labels" -}}
helm.sh/chart: {{ include "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.chart" . }}
{{ include "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1487e521-f2d9-43b7-825e-2ef9279f1510.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}