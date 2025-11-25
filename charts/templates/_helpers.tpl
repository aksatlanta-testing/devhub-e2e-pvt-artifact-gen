
{{- define "go-echo76703798-e149-42ec-87f2-db1e7e58a739.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76703798-e149-42ec-87f2-db1e7e58a739.fullname" -}}
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


{{- define "go-echo76703798-e149-42ec-87f2-db1e7e58a739.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76703798-e149-42ec-87f2-db1e7e58a739.labels" -}}
helm.sh/chart: {{ include "go-echo76703798-e149-42ec-87f2-db1e7e58a739.chart" . }}
{{ include "go-echo76703798-e149-42ec-87f2-db1e7e58a739.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76703798-e149-42ec-87f2-db1e7e58a739.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76703798-e149-42ec-87f2-db1e7e58a739.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}