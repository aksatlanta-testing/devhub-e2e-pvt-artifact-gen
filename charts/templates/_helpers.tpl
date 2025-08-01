
{{- define "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.fullname" -}}
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


{{- define "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.labels" -}}
helm.sh/chart: {{ include "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.chart" . }}
{{ include "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06f4bccd-23f5-406d-adda-bbe21a01b664.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}