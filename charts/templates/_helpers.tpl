
{{- define "go-echoc09c039f-c91f-429d-be32-18bcf056053b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc09c039f-c91f-429d-be32-18bcf056053b.fullname" -}}
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


{{- define "go-echoc09c039f-c91f-429d-be32-18bcf056053b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc09c039f-c91f-429d-be32-18bcf056053b.labels" -}}
helm.sh/chart: {{ include "go-echoc09c039f-c91f-429d-be32-18bcf056053b.chart" . }}
{{ include "go-echoc09c039f-c91f-429d-be32-18bcf056053b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc09c039f-c91f-429d-be32-18bcf056053b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc09c039f-c91f-429d-be32-18bcf056053b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}