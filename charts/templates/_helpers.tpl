
{{- define "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.fullname" -}}
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


{{- define "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.labels" -}}
helm.sh/chart: {{ include "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.chart" . }}
{{ include "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9d6ebe2-7bc1-41ba-842a-825418068e7a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}