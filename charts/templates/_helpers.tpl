
{{- define "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.fullname" -}}
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


{{- define "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.labels" -}}
helm.sh/chart: {{ include "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.chart" . }}
{{ include "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod58a4739-2082-4aa3-bb01-3e48be2133ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}