
{{- define "go-echobef04443-876b-4f74-843e-aab19024f49f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobef04443-876b-4f74-843e-aab19024f49f.fullname" -}}
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


{{- define "go-echobef04443-876b-4f74-843e-aab19024f49f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobef04443-876b-4f74-843e-aab19024f49f.labels" -}}
helm.sh/chart: {{ include "go-echobef04443-876b-4f74-843e-aab19024f49f.chart" . }}
{{ include "go-echobef04443-876b-4f74-843e-aab19024f49f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobef04443-876b-4f74-843e-aab19024f49f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobef04443-876b-4f74-843e-aab19024f49f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}