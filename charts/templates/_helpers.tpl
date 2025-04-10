
{{- define "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.fullname" -}}
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


{{- define "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.labels" -}}
helm.sh/chart: {{ include "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.chart" . }}
{{ include "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0d402b8c-c260-4a51-9c77-2dad33939955.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}