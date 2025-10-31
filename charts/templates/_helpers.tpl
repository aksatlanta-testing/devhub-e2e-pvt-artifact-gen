
{{- define "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.fullname" -}}
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


{{- define "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.labels" -}}
helm.sh/chart: {{ include "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.chart" . }}
{{ include "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa15a8161-0031-4fe9-b819-c2cf1eca9a8d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}