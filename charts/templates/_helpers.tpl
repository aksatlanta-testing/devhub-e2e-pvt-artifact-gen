
{{- define "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.fullname" -}}
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


{{- define "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.labels" -}}
helm.sh/chart: {{ include "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.chart" . }}
{{ include "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7b17f4e4-2558-4352-b7a5-75f2a7823dcc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}