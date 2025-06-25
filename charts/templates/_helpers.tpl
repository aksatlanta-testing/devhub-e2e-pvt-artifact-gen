
{{- define "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.fullname" -}}
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


{{- define "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.labels" -}}
helm.sh/chart: {{ include "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.chart" . }}
{{ include "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24a68d77-3e3c-43b2-b6a9-5ae7f884703c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}