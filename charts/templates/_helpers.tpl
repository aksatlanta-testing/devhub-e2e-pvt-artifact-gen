
{{- define "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.fullname" -}}
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


{{- define "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.labels" -}}
helm.sh/chart: {{ include "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.chart" . }}
{{ include "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo23b0a802-4ea2-41dc-8e11-dbdaedf66fec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}