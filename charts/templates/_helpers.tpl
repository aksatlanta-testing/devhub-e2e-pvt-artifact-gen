
{{- define "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.fullname" -}}
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


{{- define "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.labels" -}}
helm.sh/chart: {{ include "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.chart" . }}
{{ include "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8922305c-168c-4ff3-bc87-edab15b7f54f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}