
{{- define "go-echo36938974-599d-42ce-95e9-16424e148afe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36938974-599d-42ce-95e9-16424e148afe.fullname" -}}
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


{{- define "go-echo36938974-599d-42ce-95e9-16424e148afe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36938974-599d-42ce-95e9-16424e148afe.labels" -}}
helm.sh/chart: {{ include "go-echo36938974-599d-42ce-95e9-16424e148afe.chart" . }}
{{ include "go-echo36938974-599d-42ce-95e9-16424e148afe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo36938974-599d-42ce-95e9-16424e148afe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo36938974-599d-42ce-95e9-16424e148afe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}