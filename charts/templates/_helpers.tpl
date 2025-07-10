
{{- define "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.fullname" -}}
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


{{- define "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.labels" -}}
helm.sh/chart: {{ include "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.chart" . }}
{{ include "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5e4ffbb3-8e4d-494b-a54c-01fdcbdacd33.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}