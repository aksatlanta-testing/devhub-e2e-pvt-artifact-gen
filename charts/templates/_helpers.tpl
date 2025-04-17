
{{- define "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.fullname" -}}
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


{{- define "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.labels" -}}
helm.sh/chart: {{ include "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.chart" . }}
{{ include "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo692fd0c7-5d9e-427f-9142-7576a7927602.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}