
{{- define "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.fullname" -}}
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


{{- define "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.labels" -}}
helm.sh/chart: {{ include "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.chart" . }}
{{ include "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc93d1ffc-14eb-498b-bd54-d4043ac94283.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}