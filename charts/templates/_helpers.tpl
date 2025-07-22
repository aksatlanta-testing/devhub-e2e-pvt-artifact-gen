
{{- define "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.fullname" -}}
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


{{- define "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.labels" -}}
helm.sh/chart: {{ include "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.chart" . }}
{{ include "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9b05084d-49bf-4cbe-b7df-2eba66fd43ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}