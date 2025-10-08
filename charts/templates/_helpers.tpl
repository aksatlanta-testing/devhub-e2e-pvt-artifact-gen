
{{- define "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.fullname" -}}
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


{{- define "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.labels" -}}
helm.sh/chart: {{ include "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.chart" . }}
{{ include "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1c1ebec-e2a7-400f-ae95-d506da69b9ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}