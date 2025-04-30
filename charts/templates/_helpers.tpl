
{{- define "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.fullname" -}}
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


{{- define "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.labels" -}}
helm.sh/chart: {{ include "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.chart" . }}
{{ include "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeaf078ca-427f-4a90-9855-bc0c70267698.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}