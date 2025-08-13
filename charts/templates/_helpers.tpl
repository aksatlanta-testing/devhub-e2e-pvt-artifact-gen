
{{- define "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.fullname" -}}
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


{{- define "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.labels" -}}
helm.sh/chart: {{ include "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.chart" . }}
{{ include "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa53b257f-fb9b-4596-9692-c9b5bf3d22ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}