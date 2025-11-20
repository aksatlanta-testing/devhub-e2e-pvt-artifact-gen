
{{- define "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.fullname" -}}
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


{{- define "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.labels" -}}
helm.sh/chart: {{ include "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.chart" . }}
{{ include "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo560b3d5a-9e27-4cca-8af2-548c8095a740.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}