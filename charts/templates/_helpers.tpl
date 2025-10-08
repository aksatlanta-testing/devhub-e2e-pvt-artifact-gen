
{{- define "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.fullname" -}}
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


{{- define "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.labels" -}}
helm.sh/chart: {{ include "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.chart" . }}
{{ include "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08f3d40e-ab3a-4531-907e-94caa9f56afe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}