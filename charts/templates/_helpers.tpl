
{{- define "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.fullname" -}}
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


{{- define "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.labels" -}}
helm.sh/chart: {{ include "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.chart" . }}
{{ include "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb102016-f19b-4eaa-a45f-46537a1ec13b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}