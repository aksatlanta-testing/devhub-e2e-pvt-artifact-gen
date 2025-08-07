
{{- define "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.fullname" -}}
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


{{- define "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.labels" -}}
helm.sh/chart: {{ include "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.chart" . }}
{{ include "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodbfa3f03-c815-4a89-b27e-87b4eff3e933.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}