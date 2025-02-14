
{{- define "go-echoa538394a-579f-45fd-a272-11b77e618a7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa538394a-579f-45fd-a272-11b77e618a7b.fullname" -}}
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


{{- define "go-echoa538394a-579f-45fd-a272-11b77e618a7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa538394a-579f-45fd-a272-11b77e618a7b.labels" -}}
helm.sh/chart: {{ include "go-echoa538394a-579f-45fd-a272-11b77e618a7b.chart" . }}
{{ include "go-echoa538394a-579f-45fd-a272-11b77e618a7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa538394a-579f-45fd-a272-11b77e618a7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa538394a-579f-45fd-a272-11b77e618a7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}