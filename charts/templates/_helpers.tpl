
{{- define "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.fullname" -}}
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


{{- define "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.labels" -}}
helm.sh/chart: {{ include "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.chart" . }}
{{ include "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8dfdac2-08be-473d-a2e1-998e04e71dfe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}