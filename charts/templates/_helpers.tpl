
{{- define "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.fullname" -}}
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


{{- define "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.labels" -}}
helm.sh/chart: {{ include "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.chart" . }}
{{ include "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof461789f-e55b-42dd-b12c-2fa1874c91eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}