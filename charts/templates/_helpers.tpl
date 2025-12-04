
{{- define "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.fullname" -}}
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


{{- define "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.labels" -}}
helm.sh/chart: {{ include "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.chart" . }}
{{ include "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeccc3c18-b03a-491e-8ca0-e077a6e73961.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}