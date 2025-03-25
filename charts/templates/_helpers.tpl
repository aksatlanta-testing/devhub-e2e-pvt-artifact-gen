
{{- define "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.fullname" -}}
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


{{- define "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.labels" -}}
helm.sh/chart: {{ include "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.chart" . }}
{{ include "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3930c49c-fad1-494e-9cfe-613d88fe6bbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}