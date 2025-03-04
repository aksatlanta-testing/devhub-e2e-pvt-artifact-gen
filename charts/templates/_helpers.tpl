
{{- define "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.fullname" -}}
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


{{- define "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.labels" -}}
helm.sh/chart: {{ include "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.chart" . }}
{{ include "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe11283aa-4af1-4086-8e90-fc08be1e2705.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}