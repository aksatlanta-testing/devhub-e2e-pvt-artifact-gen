
{{- define "go-echoe0077056-407b-48fb-868b-cf2a6109926e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0077056-407b-48fb-868b-cf2a6109926e.fullname" -}}
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


{{- define "go-echoe0077056-407b-48fb-868b-cf2a6109926e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe0077056-407b-48fb-868b-cf2a6109926e.labels" -}}
helm.sh/chart: {{ include "go-echoe0077056-407b-48fb-868b-cf2a6109926e.chart" . }}
{{ include "go-echoe0077056-407b-48fb-868b-cf2a6109926e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe0077056-407b-48fb-868b-cf2a6109926e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe0077056-407b-48fb-868b-cf2a6109926e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}