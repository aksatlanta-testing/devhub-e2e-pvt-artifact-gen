
{{- define "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.fullname" -}}
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


{{- define "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.labels" -}}
helm.sh/chart: {{ include "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.chart" . }}
{{ include "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53553386-7eb7-403f-8c47-8eb2e6389948.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}