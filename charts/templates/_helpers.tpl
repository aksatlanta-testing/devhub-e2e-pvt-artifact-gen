
{{- define "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.fullname" -}}
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


{{- define "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.labels" -}}
helm.sh/chart: {{ include "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.chart" . }}
{{ include "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoba1db31d-807b-4e4e-9718-0fb9c6e3ffef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}