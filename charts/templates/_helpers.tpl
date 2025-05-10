
{{- define "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.fullname" -}}
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


{{- define "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.labels" -}}
helm.sh/chart: {{ include "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.chart" . }}
{{ include "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf794eca-8ae9-4704-bc6c-291f70e54dac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}