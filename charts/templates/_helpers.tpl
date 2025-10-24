
{{- define "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.fullname" -}}
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


{{- define "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.labels" -}}
helm.sh/chart: {{ include "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.chart" . }}
{{ include "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2de949f7-8351-4275-845f-55a54ddf3fdc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}