
{{- define "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.fullname" -}}
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


{{- define "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.labels" -}}
helm.sh/chart: {{ include "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.chart" . }}
{{ include "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo694263fc-c568-4d47-95d2-74232e9d17ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}