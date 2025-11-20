
{{- define "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.fullname" -}}
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


{{- define "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.labels" -}}
helm.sh/chart: {{ include "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.chart" . }}
{{ include "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedb39c0e-0682-4dc3-9cb4-abb644348755.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}