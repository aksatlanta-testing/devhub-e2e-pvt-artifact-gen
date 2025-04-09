
{{- define "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.fullname" -}}
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


{{- define "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.labels" -}}
helm.sh/chart: {{ include "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.chart" . }}
{{ include "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo04bf10b6-2752-426c-96ac-f1c5df117dbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}