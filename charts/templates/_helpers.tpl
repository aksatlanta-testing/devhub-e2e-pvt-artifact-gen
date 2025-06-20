
{{- define "go-echoebff50df-09c4-435f-bf58-e9924408be62.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebff50df-09c4-435f-bf58-e9924408be62.fullname" -}}
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


{{- define "go-echoebff50df-09c4-435f-bf58-e9924408be62.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebff50df-09c4-435f-bf58-e9924408be62.labels" -}}
helm.sh/chart: {{ include "go-echoebff50df-09c4-435f-bf58-e9924408be62.chart" . }}
{{ include "go-echoebff50df-09c4-435f-bf58-e9924408be62.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebff50df-09c4-435f-bf58-e9924408be62.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebff50df-09c4-435f-bf58-e9924408be62.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}