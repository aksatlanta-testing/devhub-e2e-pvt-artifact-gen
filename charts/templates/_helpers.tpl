
{{- define "go-echob302fd95-d704-454c-a988-40f670218bdd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob302fd95-d704-454c-a988-40f670218bdd.fullname" -}}
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


{{- define "go-echob302fd95-d704-454c-a988-40f670218bdd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob302fd95-d704-454c-a988-40f670218bdd.labels" -}}
helm.sh/chart: {{ include "go-echob302fd95-d704-454c-a988-40f670218bdd.chart" . }}
{{ include "go-echob302fd95-d704-454c-a988-40f670218bdd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob302fd95-d704-454c-a988-40f670218bdd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob302fd95-d704-454c-a988-40f670218bdd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}