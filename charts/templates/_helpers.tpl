
{{- define "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.fullname" -}}
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


{{- define "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.labels" -}}
helm.sh/chart: {{ include "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.chart" . }}
{{ include "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda9a357e-8da9-443a-b45e-d59f1cf1b107.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}