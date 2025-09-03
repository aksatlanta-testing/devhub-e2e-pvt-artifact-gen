
{{- define "go-echofafcd786-6c8c-4201-845f-c525e399f30d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofafcd786-6c8c-4201-845f-c525e399f30d.fullname" -}}
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


{{- define "go-echofafcd786-6c8c-4201-845f-c525e399f30d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofafcd786-6c8c-4201-845f-c525e399f30d.labels" -}}
helm.sh/chart: {{ include "go-echofafcd786-6c8c-4201-845f-c525e399f30d.chart" . }}
{{ include "go-echofafcd786-6c8c-4201-845f-c525e399f30d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofafcd786-6c8c-4201-845f-c525e399f30d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofafcd786-6c8c-4201-845f-c525e399f30d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}