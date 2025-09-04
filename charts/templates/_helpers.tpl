
{{- define "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.fullname" -}}
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


{{- define "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.labels" -}}
helm.sh/chart: {{ include "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.chart" . }}
{{ include "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57109b1e-b6b1-43f4-93b2-2bf3c1b609de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}