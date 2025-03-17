
{{- define "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.fullname" -}}
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


{{- define "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.labels" -}}
helm.sh/chart: {{ include "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.chart" . }}
{{ include "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfe94d16-6bad-484d-bd03-6c910010d52e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}