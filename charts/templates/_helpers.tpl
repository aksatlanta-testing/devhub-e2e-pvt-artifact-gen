
{{- define "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.fullname" -}}
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


{{- define "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.labels" -}}
helm.sh/chart: {{ include "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.chart" . }}
{{ include "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo424ea1f8-67f3-4295-9ef9-dc4926e0f308.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}