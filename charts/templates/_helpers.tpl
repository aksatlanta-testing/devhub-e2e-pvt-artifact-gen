
{{- define "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.fullname" -}}
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


{{- define "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.labels" -}}
helm.sh/chart: {{ include "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.chart" . }}
{{ include "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01d2af42-896c-4672-9e3b-71a2ffae35cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}