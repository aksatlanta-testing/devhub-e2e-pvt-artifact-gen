
{{- define "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.fullname" -}}
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


{{- define "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.labels" -}}
helm.sh/chart: {{ include "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.chart" . }}
{{ include "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo87b9a04b-3879-4a74-bd21-c894cd3f620f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}