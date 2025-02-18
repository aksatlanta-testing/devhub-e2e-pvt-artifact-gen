
{{- define "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.fullname" -}}
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


{{- define "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.labels" -}}
helm.sh/chart: {{ include "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.chart" . }}
{{ include "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3238339-a17f-44e3-9a01-21b16a8057cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}