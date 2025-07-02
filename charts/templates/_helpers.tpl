
{{- define "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.fullname" -}}
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


{{- define "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.labels" -}}
helm.sh/chart: {{ include "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.chart" . }}
{{ include "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3029e699-c4db-4c54-83b9-bbe5c759ceef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}