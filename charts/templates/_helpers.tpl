
{{- define "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.fullname" -}}
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


{{- define "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.labels" -}}
helm.sh/chart: {{ include "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.chart" . }}
{{ include "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf5d9749-7864-4e4e-bb22-c00d70dc7075.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}