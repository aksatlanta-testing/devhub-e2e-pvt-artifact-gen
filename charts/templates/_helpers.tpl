
{{- define "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.fullname" -}}
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


{{- define "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.labels" -}}
helm.sh/chart: {{ include "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.chart" . }}
{{ include "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo277090aa-b447-48c5-af08-5c91ab40a29b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}