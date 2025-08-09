
{{- define "go-echofb2536f3-0478-4681-868e-a025d81ca01a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb2536f3-0478-4681-868e-a025d81ca01a.fullname" -}}
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


{{- define "go-echofb2536f3-0478-4681-868e-a025d81ca01a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb2536f3-0478-4681-868e-a025d81ca01a.labels" -}}
helm.sh/chart: {{ include "go-echofb2536f3-0478-4681-868e-a025d81ca01a.chart" . }}
{{ include "go-echofb2536f3-0478-4681-868e-a025d81ca01a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb2536f3-0478-4681-868e-a025d81ca01a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb2536f3-0478-4681-868e-a025d81ca01a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}