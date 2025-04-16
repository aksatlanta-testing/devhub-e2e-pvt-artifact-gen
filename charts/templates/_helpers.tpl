
{{- define "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.fullname" -}}
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


{{- define "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.labels" -}}
helm.sh/chart: {{ include "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.chart" . }}
{{ include "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce31eb56-d267-4aea-9a7c-8dda2abe5589.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}