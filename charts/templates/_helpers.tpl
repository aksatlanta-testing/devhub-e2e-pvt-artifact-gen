
{{- define "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.fullname" -}}
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


{{- define "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.labels" -}}
helm.sh/chart: {{ include "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.chart" . }}
{{ include "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe1b9a98d-df39-4e2d-95ab-f924b5929fac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}