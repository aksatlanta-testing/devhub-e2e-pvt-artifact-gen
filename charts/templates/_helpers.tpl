
{{- define "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.fullname" -}}
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


{{- define "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.labels" -}}
helm.sh/chart: {{ include "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.chart" . }}
{{ include "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofcb600ee-dec9-4678-be5c-6fd7ad58783a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}