
{{- define "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.fullname" -}}
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


{{- define "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.labels" -}}
helm.sh/chart: {{ include "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.chart" . }}
{{ include "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob9b93341-58f2-40fb-ad6c-1de2d479798f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}