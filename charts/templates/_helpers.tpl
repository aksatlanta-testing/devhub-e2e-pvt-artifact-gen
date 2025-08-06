
{{- define "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.fullname" -}}
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


{{- define "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.labels" -}}
helm.sh/chart: {{ include "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.chart" . }}
{{ include "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof42353b3-95c2-4a62-a54f-cf618ca8d1ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}