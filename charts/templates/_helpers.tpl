
{{- define "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.fullname" -}}
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


{{- define "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.labels" -}}
helm.sh/chart: {{ include "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.chart" . }}
{{ include "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9e97a43c-609c-4fcb-bc3e-ef82fcd1fcde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}