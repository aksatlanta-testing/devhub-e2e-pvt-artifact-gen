
{{- define "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.fullname" -}}
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


{{- define "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.labels" -}}
helm.sh/chart: {{ include "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.chart" . }}
{{ include "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof0cdfc20-aab9-4d4a-8e47-b5c85d43a44b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}