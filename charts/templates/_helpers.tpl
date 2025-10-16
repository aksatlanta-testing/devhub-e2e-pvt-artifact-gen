
{{- define "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.fullname" -}}
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


{{- define "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.labels" -}}
helm.sh/chart: {{ include "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.chart" . }}
{{ include "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61e030b2-befa-441a-a021-56fbcddc0bac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}