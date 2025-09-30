
{{- define "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.fullname" -}}
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


{{- define "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.labels" -}}
helm.sh/chart: {{ include "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.chart" . }}
{{ include "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3bbc3de9-deff-4516-b71f-0c5df3aad08f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}