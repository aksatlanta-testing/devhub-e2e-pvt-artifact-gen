
{{- define "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.fullname" -}}
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


{{- define "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.labels" -}}
helm.sh/chart: {{ include "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.chart" . }}
{{ include "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4920787-b010-4798-8d1f-40d6ee39b93a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}