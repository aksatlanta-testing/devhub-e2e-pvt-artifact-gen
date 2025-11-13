
{{- define "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.fullname" -}}
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


{{- define "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.labels" -}}
helm.sh/chart: {{ include "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.chart" . }}
{{ include "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe1734adf-2331-427e-9e14-d4c959c4b6af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}